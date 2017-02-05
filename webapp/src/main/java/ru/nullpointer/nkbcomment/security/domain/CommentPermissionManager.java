package ru.nullpointer.nkbcomment.security.domain;

import java.util.ArrayList;
import java.util.Collections;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import ru.nullpointer.nkbcomment.domain.Comment;
import ru.nullpointer.nkbcomment.domain.Moderation;
import ru.nullpointer.nkbcomment.service.SecurityService;
import static ru.nullpointer.nkbcomment.security.domain.Permission.*;

/**
 *
 * @author Alexander Yastrebov
 */
@Service
public class CommentPermissionManager {

    private Map<CommentPermission, PermissionEvaluator<Comment>> evaluatorMap;
    //
    @Resource
    private SecurityService securityService;

    public CommentPermissionManager() {
        evaluatorMap = new EnumMap<CommentPermission, PermissionEvaluator<Comment>>(CommentPermission.class);

        evaluatorMap.put(CommentPermission.EDIT, new PermissionEvaluator<Comment>() {

            @Override
            public boolean hasPermission(Comment comment) {
                String userId = securityService.getAuthenticatedUserId();
                // Только автор может редактировать контент
                boolean isAuthor = userId.equals(comment.getAuthorId()) && securityService.hasPermission(userId, EDIT);
                // Нельзя редактитровать подтвержденный комментарий
                boolean notApproved = comment.getModeration().getStatus() != Moderation.Status.APPROVED;

                return (isAuthor && notApproved);
            }
        });

        evaluatorMap.put(CommentPermission.DELETE, new PermissionEvaluator<Comment>() {

            @Override
            public boolean hasPermission(Comment comment) {
                String userId = securityService.getAuthenticatedUserId();
                return securityService.hasPermission(userId, DELETE);
            }
        });

        evaluatorMap.put(CommentPermission.MODERATE, new PermissionEvaluator<Comment>() {

            @Override
            public boolean hasPermission(Comment comment) {
                String userId = securityService.getAuthenticatedUserId();
                return securityService.hasPermission(userId, MODERATE);
            }
        });

        evaluatorMap.put(CommentPermission.VERIFY, new PermissionEvaluator<Comment>() {

            @Override
            public boolean hasPermission(Comment comment) {
                String userId = securityService.getAuthenticatedUserId();
                return securityService.hasPermission(userId, VERIFY);
            }
        });

        evaluatorMap.put(CommentPermission.EDIT_SCOPE, new PermissionEvaluator<Comment>() {

            @Override
            public boolean hasPermission(Comment comment) {
                String userId = securityService.getAuthenticatedUserId();
                boolean canEditScope = securityService.hasPermission(userId, EDIT_SCOPE);
                boolean isAuthor = userId.equals(comment.getAuthorId()) && securityService.hasPermission(userId, EDIT);

                return (canEditScope || isAuthor);
            }
        });

        evaluatorMap = Collections.unmodifiableMap(evaluatorMap);

        Assert.isTrue(evaluatorMap.size() == CommentPermission.values().length);
    }

    public void setPermissions(Comment comment) {
        List<CommentPermission> permissions = new ArrayList<CommentPermission>();

        for (CommentPermission p : CommentPermission.values()) {
            PermissionEvaluator<Comment> e = evaluatorMap.get(p);
            if (e.hasPermission(comment)) {
                permissions.add(p);
            }
        }
        comment.setPermissions(permissions);
    }

    public void ensureHasPermission(Comment comment, CommentPermission permission) {
        PermissionEvaluator<Comment> e = evaluatorMap.get(permission);
        if (!e.hasPermission(comment)) {
            securityService.accessDenied("Not enough permissions");
        }
    }
}
