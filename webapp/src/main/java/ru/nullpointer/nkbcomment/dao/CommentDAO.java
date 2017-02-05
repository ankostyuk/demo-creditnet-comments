package ru.nullpointer.nkbcomment.dao;

import java.util.Date;
import java.util.List;
import java.util.Set;
import ru.nullpointer.nkbcomment.domain.Comment;
import ru.nullpointer.nkbcomment.domain.Moderation.Status;
import ru.nullpointer.nkbcomment.domain.PostInfo;
import ru.nullpointer.nkbcomment.support.PageConfig;
import ru.nullpointer.nkbcomment.support.PaginatedQueryResult;

/**
 *
 * @author Alexander Yastrebov
 */
public interface CommentDAO {

    Comment getById(String id);

    void insert(Comment comment);

    void update(Comment comment);

    void delete(String id);

    Comment getPublicById(String id, String userId, Set<String> shareGroups);

    List<Comment> getListByPostIdSet(Set<String> postIdSet, Set<String> tags);

    List<PostInfo> getPostInfoByPostIdSet(Set<String> postIdSet);

    List<PostInfo> getPublicPostInfoByPostIdSet(Set<String> postIdSet, String userId, Set<String> shareGroups);

    List<Comment> getPublicListByPostIdSet(Set<String> postIdSet, String userId, Set<String> shareGroups, Set<String> tags);

    PaginatedQueryResult<Comment> getPaginatedListByPostId(String postId, PageConfig pageConfig, Set<String> tags);

    PaginatedQueryResult<Comment> getPublicPaginatedListByPostId(String postId, PageConfig pageConfig, String userId, Set<String> shareGroups, Set<String> tags);

    PaginatedQueryResult<Comment> getPaginatedListByUserGroups(PageConfig pageConfig, Set<String> shareGroups, Set<String> tags);

    List<Comment> getListByPostIdPrefixSet(Set<String> postIdPrefixSet, Set<String> tags);

    List<Comment> getPublicListByPostIdPrefixSet(Set<String> postIdPrefixSet, String userId, Set<String> shareGroups, Set<String> tags);

    List<Comment> getListByStatus(Status status, Date startDate, String startId, int limit, Set<String> tags);

    List<Comment> getListByAuthor(String userId, Date startDate, String startId, int limit, Set<String> tags);
}
