package ru.nullpointer.nkbcomment.utils;

import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import static org.junit.Assert.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.mongodb.core.MongoTemplate;
import ru.nullpointer.nkbcomment.domain.Comment;
import ru.nullpointer.nkbcomment.domain.Moderation;
import ru.nullpointer.nkbcomment.domain.Moderation.Status;
import ru.nullpointer.nkbcomment.domain.Scope;
import ru.nullpointer.nkbcomment.domain.Scope.Visibility;
import ru.nullpointer.nkbcomment.domain.Verification;

/**
 *
 * @author Alexander Yastrebov
 */
public class CommentGenerator {

    private Logger logger = LoggerFactory.getLogger(CommentGenerator.class);
    //
    private MongoTemplate mongoTemplate;

    public CommentGenerator(MongoTemplate mongoTemplate) {
        this.mongoTemplate = mongoTemplate;
    }

    /**
     * Генерирует набор комментариев со всеми возможными комбинациями параметров
     */
    public int generate(String[] postIds, String[] userIds, Status[] statuses, String[] moderatorIds, Visibility[] visibilities, Set<String>[] shareGroups) {
        int size = 1;

        size *= postIds.length;
        size *= userIds.length;
        size *= statuses.length;
        size *= moderatorIds.length;
        size *= visibilities.length;
        size *= shareGroups.length;

        long now = System.currentTimeMillis();
        for (int i = 0; i < size; i++) {
            int len, rem = i;

            len = postIds.length;
            String pid = postIds[rem % len];
            rem /= len;

            len = userIds.length;
            String uid = userIds[rem % len];
            rem /= len;

            len = statuses.length;
            Status st = statuses[rem % len];
            rem /= len;

            len = moderatorIds.length;
            String mid = moderatorIds[rem % len];
            rem /= len;

            len = visibilities.length;
            Visibility vs = visibilities[rem % len];
            rem /= len;

            len = shareGroups.length;
            Set<String> sg = shareGroups[rem % len];
            rem /= len;

            createComment(now + i, pid, uid, st, mid, vs, sg);
        }

        logger.debug("Generated {} comments", size);

        return size;
    }

    public void createComment(long date, String postId, String authorId, Status status, String moderatorId, Visibility visibility, Set<String> shareGroups) {
        Comment c = new Comment();
        c.setPostId(postId);
        c.setAuthorId(authorId);
        c.setCreated(new Date(date));
        c.setContent("some content");

        Moderation m = new Moderation();
        c.setModeration(m);

        m.setStatus(status);
        switch (status) {
            case PENDING:
                break;

            case APPROVED:
                assertNotNull(moderatorId);
                m.setModeratorId(moderatorId);
                m.setUpdated(new Date(date));
                break;

            case REJECTED:
                assertNotNull(moderatorId);
                m.setModeratorId(moderatorId);
                m.setRejectionReason("some reason");
                m.setUpdated(new Date(date));
                break;

            default:
                fail("Unknown moderation status");
        }

        Scope s = new Scope();
        c.setScope(s);

        s.setVisibility(visibility);
        switch (visibility) {
            case PRIVATE:
                break;

            case PUBLIC:
                break;

            case GROUP:
                assertTrue(shareGroups.size() > 0);
                s.setShareGroups(shareGroups);
                break;

            default:
                fail("Unknown scope visibility");
        }

        Verification v = new Verification();
        v.setVerified(false);
        c.setVerification(v);

        mongoTemplate.insert(c);
    }

    public static Set<String> set(String... s) {
        return new HashSet<String>(Arrays.asList(s));
    }

    public static String[] str(String... s) {
        return s;
    }

    @SuppressWarnings("unchecked")
    public static Set<String>[] strset(Set... s) {
        return s;
    }

    public static Status[] st(Status... s) {
        return s;
    }

    public static Visibility[] vs(Visibility... v) {
        return v;
    }
}