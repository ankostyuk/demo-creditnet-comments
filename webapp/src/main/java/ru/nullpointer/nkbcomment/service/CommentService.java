package ru.nullpointer.nkbcomment.service;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import ru.nullpointer.nkbcomment.dao.CommentDAO;
import ru.nullpointer.nkbcomment.domain.*;
import ru.nullpointer.nkbcomment.domain.Moderation.Status;
import ru.nullpointer.nkbcomment.filestorage.FileStorage;
import ru.nullpointer.nkbcomment.security.domain.CommentPermission;
import ru.nullpointer.nkbcomment.security.domain.CommentPermissionManager;
import ru.nullpointer.nkbcomment.support.PageConfig;
import ru.nullpointer.nkbcomment.support.PaginatedQueryResult;
import javax.activation.DataHandler;
import javax.annotation.Resource;
import java.io.IOException;
import java.util.*;
import org.springframework.util.CollectionUtils;
import static ru.nullpointer.nkbcomment.domain.Moderation.Status.PENDING;
import static ru.nullpointer.nkbcomment.domain.Moderation.Status.REJECTED;
import static ru.nullpointer.nkbcomment.domain.Scope.Visibility.GROUP;
import static ru.nullpointer.nkbcomment.security.domain.Permission.*;

/**
 *
 * @author Alexander Yastrebov
 */
@Service
public class CommentService {

    private Logger logger = LoggerFactory.getLogger(CommentService.class);
    //
    @Resource
    private CommentDAO commentDAO;
    //
    @Resource
    private TimeService timeService;
    //
    @Resource
    private SecurityService securityService;
    //
    @Resource
    private FileStorage fileStorage;
    //
    @Resource
    private CommentPermissionManager commentPermissionManager;

    public Comment addComment(Comment comment) {
        securityService.ensureHasPermission(CREATE);

        Assert.notNull(comment);
        ValidationUtils.checkNotBlank(comment, "postId", "content");
        ValidationUtils.checkRequired(comment, "scope", "scope.visibility");
        ValidationUtils.trimToNull(comment, "title");

        String userId = securityService.getAuthenticatedUserId();
        comment.setAuthorId(userId);
        comment.setCreated(timeService.now());
        comment.setEdited(null);

        cleanupShareGroups(comment, userId);

        // TODO: Статус модерации и верификации при создании,
        // если у пользователя есть соответствующие права
        setPendingModeration(comment);
        setNotVerified(comment);
        comment.setAttachments(null);

        logger.debug("Inserting comment: {}", comment);

        commentDAO.insert(comment);

        fillTransients(Collections.singletonList(comment));

        return comment;
    }

    public Comment getComment(String id) {
        securityService.ensureHasPermission(VIEW);
        String userId = securityService.getAuthenticatedUserId();

        Comment comment = findPublicCommentById(id, userId);

        fillTransients(Collections.singletonList(comment));

        return comment;
    }

    public Comment updateComment(Comment updated) {
        Assert.notNull(updated);
        ValidationUtils.checkNotBlank(updated, "id");

        Comment stored = findCommentById(updated.getId());

        boolean hasUpdates = false;

        hasUpdates |= updateCommentContent(stored, updated);
        hasUpdates |= updateCommentTags(stored, updated);
        hasUpdates |= updateCommentScope(stored, updated);
        hasUpdates |= updateCommentModeration(stored, updated);
        hasUpdates |= updateCommentVerification(stored, updated);

        if (hasUpdates) {
            logger.debug("Updating comment: {}", stored);

            commentDAO.update(stored);
        } else {
            // TODO: Бросить исключение при отсутствии изменений?
        }

        fillTransients(Collections.singletonList(stored));

        return stored;
    }

    public void deleteComment(String id) {
        Assert.hasText(id);

        Comment comment = findCommentById(id);
        commentPermissionManager.ensureHasPermission(comment, CommentPermission.DELETE);

        List<Attachment> attachments = comment.getAttachments();
        if (attachments != null) {
            for (Attachment a : attachments) {
                fileStorage.delete(a.getId());
            }
        }

        commentDAO.delete(id);
    }

    public Attachment addAttachment(String id, Attachment attachment) {
        Assert.hasText(id);
        Assert.notNull(attachment);

        ValidationUtils.checkRequired(attachment, "name", "contentType", "dataHandler");

        DataHandler dataHandler = attachment.getDataHandler();
        if (isEmptyContent(dataHandler)) {
            throw new BadArgumentException("attachment content is empty");
        }

        Comment comment = findCommentById(id);

        commentPermissionManager.ensureHasPermission(comment, CommentPermission.EDIT);

        StoredFile sf = new StoredFile();
        sf.setDataHandler(dataHandler);
        sf.setFilename(attachment.getName());
        if (fileStorage.store(sf) == null) {
            throw new CommentServiceException("Unable to store file");
        }

        attachment.setId(sf.getId());
        attachment.setCreated(timeService.now());

        List<Attachment> attachments = comment.getAttachments();
        if (attachments == null) {
            attachments = new ArrayList<Attachment>(1);
            comment.setAttachments(attachments);
        }
        attachments.add(attachment);

        commentDAO.update(comment);

        return attachment;
    }

    public Attachment getAttachmentWithContent(String commentId, String attachmentId) {
        Assert.hasText(commentId);
        Assert.hasText(attachmentId);

        securityService.ensureHasPermission(VIEW);
        String userId = securityService.getAuthenticatedUserId();

        Comment comment = findPublicCommentById(commentId, userId);
        Attachment attachment = findAttachment(comment, attachmentId);

        StoredFile sf = fileStorage.load(attachmentId);
        if (sf == null) {
            throw new NotFoundException("Content for attachment with id '" + attachmentId + "' not found");
        }

        attachment.setDataHandler(sf.getDataHandler());

        return attachment;
    }

    public void deleteAttachment(String commentId, String attachmentId) {
        Assert.hasText(commentId);
        Assert.hasText(attachmentId);

        Comment comment = findCommentById(commentId);

        commentPermissionManager.ensureHasPermission(comment, CommentPermission.EDIT);

        findAttachment(comment, attachmentId);

        fileStorage.delete(attachmentId);

        Iterator<Attachment> it = comment.getAttachments().iterator();
        while (it.hasNext()) {
            Attachment a = it.next();
            if (attachmentId.equals(a.getId())) {
                it.remove();
                break;
            }
        }
        commentDAO.update(comment);
    }

    public List<Post> getCommentsByPost(Set<String> postIdSet, Set<String> tags) {
        securityService.ensureHasPermission(VIEW);
        String userId = securityService.getAuthenticatedUserId();

        if (postIdSet == null || postIdSet.isEmpty()) {
            throw new BadArgumentException("One or more 'postId' required");
        }

        List<Comment> list;
        if (isStuffMember(userId)) {
            list = commentDAO.getListByPostIdSet(postIdSet, tags);
        } else {
            list = commentDAO.getPublicListByPostIdSet(postIdSet, userId, securityService.getShareGroupIds(userId), tags);
        }

        fillTransients(list);

        return buildPostList(list);
    }

    public PaginatedQueryResult<Comment> getPaginatedCommentListByPost(String postId, Set<String> tags, Integer pageNumber, Integer pageSize) {
        securityService.ensureHasPermission(VIEW);
        String userId = securityService.getAuthenticatedUserId();

        if (StringUtils.isBlank(postId)) {
            throw new BadArgumentException("'postId' required");
        }
        PageConfig pageConfig = createPageConfig(pageNumber, pageSize);

        PaginatedQueryResult<Comment> result;
        if (isStuffMember(userId)) {
            result = commentDAO.getPaginatedListByPostId(postId, pageConfig, tags);
        } else {
            result = commentDAO.getPublicPaginatedListByPostId(postId, pageConfig, userId, securityService.getShareGroupIds(userId), tags);
        }

        fillTransients(result.getList());

        return result;
    }

    public List<Post> getCommentsByPostPrefix(Set<String> postIdPrefixSet, Set<String> tags) {
        securityService.ensureHasPermission(VIEW);
        String userId = securityService.getAuthenticatedUserId();

        if (postIdPrefixSet == null || postIdPrefixSet.isEmpty()) {
            throw new BadArgumentException("One or more 'postIdPrefix' required");
        }

        List<Comment> list;
        if (isStuffMember(userId)) {
            list = commentDAO.getListByPostIdPrefixSet(postIdPrefixSet, tags);
        } else {
            list = commentDAO.getPublicListByPostIdPrefixSet(postIdPrefixSet, userId, securityService.getShareGroupIds(userId), tags);
        }

        fillTransients(list);

        return buildPostList(list);
    }

    public List<Comment> getCommentsByStatus(Status status, Date startDate, String startId, int limit, Set<String> tags) {
        securityService.ensureHasPermission(MODERATE);
        checkLimit(limit);

        List<Comment> list = commentDAO.getListByStatus(status, startDate, startId, limit, tags);

        fillTransients(list);

        return list;
    }

    public List<Comment> getCommentsByAuthor(Date startDate, String startId, int limit, Set<String> tags) {
        securityService.ensureHasPermission(VIEW);
        checkLimit(limit);
        String userId = securityService.getAuthenticatedUserId();

        List<Comment> list = commentDAO.getListByAuthor(userId, startDate, startId, limit, tags);

        fillTransients(list);

        return list;
    }

    public List<PostInfo> getPostInfo(Set<String> postIdSet) {
        securityService.ensureHasPermission(VIEW);
        String userId = securityService.getAuthenticatedUserId();

        if (postIdSet == null || postIdSet.isEmpty()) {
            throw new BadArgumentException("One or more 'postId' required");
        }

        List<PostInfo> list;
        if (isStuffMember(userId)) {
            list = commentDAO.getPostInfoByPostIdSet(postIdSet);
        } else {
            list = commentDAO.getPublicPostInfoByPostIdSet(postIdSet, userId, securityService.getShareGroupIds(userId));
        }
        return list;
    }

    public PaginatedQueryResult<Comment> getPaginatedCommentListByUserGroups(Integer pageNumber, Integer pageSize, Set<String> tags) {
        securityService.ensureHasPermission(VIEW);
        String userId = securityService.getAuthenticatedUserId();

        PageConfig pageConfig = createPageConfig(pageNumber, pageSize);

        PaginatedQueryResult<Comment> result;
        result = commentDAO.getPaginatedListByUserGroups(pageConfig, securityService.getShareGroupIds(userId), tags);

        fillTransients(result.getList());

        return result;
    }

    private List<Post> buildPostList(List<Comment> comments) {
        if (comments.isEmpty()) {
            return Collections.emptyList();
        }

        List<Post> result = new ArrayList<Post>();
        Post p = null;
        for (Comment c : comments) {
            if (p == null || !c.getPostId().equals(p.getId())) {
                p = new Post();
                p.setId(c.getPostId());
                result.add(p);
            }
            p.addComment(c);
        }
        return result;
    }

    private Comment findCommentById(String id) {
        Comment comment = commentDAO.getById(id);
        if (comment == null) {
            throw new NotFoundException("Comment with id '" + id + "' not found");
        }
        return comment;
    }

    private Comment findPublicCommentById(String commentId, String userId) {
        Comment comment;
        if (isStuffMember(userId)) {
            comment = commentDAO.getById(commentId);
        } else {
            comment = commentDAO.getPublicById(commentId, userId, securityService.getShareGroupIds(userId));
        }

        if (comment == null) {
            throw new NotFoundException("Comment with id '" + commentId + "' not found");
        }
        return comment;
    }

    private void setPendingModeration(Comment c) {
        Moderation m = new Moderation();
        m.setStatus(PENDING);
        c.setModeration(m);
    }

    private void setNotVerified(Comment c) {
        Verification v = new Verification();
        v.setVerified(false);
        c.setVerification(v);
    }

    private boolean updateCommentContent(Comment stored, Comment updated) {
        if (StringUtils.isBlank(updated.getContent())) {
            return false;
        }

        commentPermissionManager.ensureHasPermission(stored, CommentPermission.EDIT);

        if (stored.getModeration().getStatus() != PENDING) {
            // Отправить на модерацию
            setPendingModeration(stored);
        }

        stored.setContent(updated.getContent());
        stored.setTitle(updated.getTitle());
        stored.setEdited(timeService.now());

        // Содержание не проверено
        setNotVerified(stored);

        return true;
    }

    private boolean updateCommentTags(Comment stored, Comment updated) {
        if (Boolean.TRUE.equals(updated.getRemoveTags())) {
            if (CollectionUtils.isEmpty(stored.getTags())) {
                return false;
            } else {
                stored.setTags(null);
                return true;
            }
        }

        Set<String> tags = updated.getTags();
        if (CollectionUtils.isEmpty(tags)) {
            return false;
        }

        commentPermissionManager.ensureHasPermission(stored, CommentPermission.EDIT);
        stored.setTags(updated.getTags());

        return true;
    }

    private boolean updateCommentScope(Comment stored, Comment updated) {
        Scope s = updated.getScope();
        if (s == null) {
            return false;
        }

        commentPermissionManager.ensureHasPermission(stored, CommentPermission.EDIT_SCOPE);

        ValidationUtils.checkRequired(updated, "scope.visibility");
        stored.setScope(s);
        cleanupShareGroups(stored, stored.getAuthorId());

        return true;
    }

    private boolean updateCommentModeration(Comment stored, Comment updated) {
        Moderation m = updated.getModeration();
        if (m == null) {
            return false;
        }

        commentPermissionManager.ensureHasPermission(stored, CommentPermission.MODERATE);

        ValidationUtils.checkRequired(updated, "moderation.status");
        if (m.getStatus() == REJECTED) {
            ValidationUtils.checkNotBlank(m, "rejectionReason");
        } else {
            m.setRejectionReason(null);
        }

        m.setModeratorId(securityService.getAuthenticatedUserId());
        m.setUpdated(timeService.now());
        stored.setModeration(m);

        return true;
    }

    private boolean updateCommentVerification(Comment stored, Comment updated) {
        Verification v = updated.getVerification();
        if (v == null) {
            return false;
        }

        commentPermissionManager.ensureHasPermission(stored, CommentPermission.VERIFY);

        ValidationUtils.checkRequired(updated, "verification.verified");
        v.setVerifierId(securityService.getAuthenticatedUserId());
        v.setUpdated(timeService.now());
        stored.setVerification(v);

        return true;
    }

    private void cleanupShareGroups(Comment c, String userId) {
        Scope s = c.getScope();
        if (s.getVisibility() != GROUP) {
            s.setShareGroups(null);
            return;
        }

        ValidationUtils.checkRequired(c, "scope.shareGroups");
        // Оставить только группы доступные пользователю
        s.getShareGroups().retainAll(securityService.getShareGroupIds(userId));

        if (s.getShareGroups().isEmpty()) {
            throw new BadArgumentException("'scope.shareGroups' contains no valid group");
        }
    }

    private boolean isStuffMember(String userId) {
        return securityService.hasPermission(userId, MODERATE)
                || securityService.hasPermission(userId, VERIFY)
                || securityService.hasPermission(userId, EDIT_SCOPE);
    }

    private void checkLimit(int limit) {
        if (limit <= 0) {
            throw new BadArgumentException("'limit' must be positive");
        }
    }

    private void fillTransients(List<Comment> comments) {
        if (comments.isEmpty()) {
            return;
        }

        Set<String> userIds = new HashSet<String>();
        for (Comment c : comments) {
            userIds.add(c.getAuthorId());
            userIds.add(c.getModeration().getModeratorId());
            userIds.add(c.getVerification().getVerifierId());
        }
        userIds.remove(null);

        Map<String, String> userNameMap = securityService.getUserNameMap(userIds);
        for (Comment c : comments) {
            String s = userNameMap.get(c.getAuthorId());
            c.setAuthorName(s != null ? s : c.getAuthorId());

            Moderation m = c.getModeration();
            s = userNameMap.get(m.getModeratorId());
            m.setModeratorName(s != null ? s : m.getModeratorId());

            Verification v = c.getVerification();
            s = userNameMap.get(v.getVerifierId());
            v.setVerifierName(s != null ? s : v.getVerifierId());

            commentPermissionManager.setPermissions(c);
        }
    }

    private boolean isEmptyContent(DataHandler dataHandler) {
        try {
            return (dataHandler.getInputStream().available() == 0);
        } catch (IOException ex) {
            throw new CommentServiceException("Error reading file content");
        }
    }

    private Attachment findAttachment(Comment comment, String attachmentId) {
        List<Attachment> attachments = comment.getAttachments();
        if (attachments != null) {
            for (Attachment a : attachments) {
                if (a.getId().equals(attachmentId)) {
                    return a;
                }
            }
        }
        throw new NotFoundException("Attachment with id '" + attachmentId + "' not found");
    }

    private PageConfig createPageConfig(Integer pageNumber, Integer pageSize) {
        try {
            return new PageConfig(pageNumber, pageSize);
        } catch (IllegalArgumentException e) {
            throw new BadArgumentException("Illegal page number or page size");
        }
    }
}
