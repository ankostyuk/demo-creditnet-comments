package ru.nullpointer.nkbcomment.service;

import java.util.Date;
import javax.annotation.Resource;
import org.junit.After;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ru.nullpointer.nkbcomment.domain.Comment;
import ru.nullpointer.nkbcomment.domain.Moderation;
import ru.nullpointer.nkbcomment.domain.Moderation.Status;
import static ru.nullpointer.nkbcomment.domain.Moderation.Status.*;
import ru.nullpointer.nkbcomment.security.SecurityProvider;
import ru.nullpointer.nkbcomment.utils.MongoUtils;
import static ru.nullpointer.nkbcomment.security.domain.Permission.*;

/**
 *
 * @author Alexander Yastrebov
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/spring/beans.xml", "/spring/applicationContext.xml"})
public class UpdateCommentModerationTest {

    private Logger logger = LoggerFactory.getLogger(UpdateCommentModerationTest.class);
    //
    @Resource
    private CommentService commentService;
    //
    @Resource
    private MongoTemplate mongoTemplate;
    //
    @Resource
    private SecurityProvider sp;
    //
    @Resource
    private MongoUtils mongoUtils;
    //
    private Comment pendingComment;
    private Comment approvedComment;
    private Comment rejectedComment;

    @Before
    public void setUp() {
        mongoTemplate.dropCollection(Comment.class);
        Mockito.reset(sp);

        mongoUtils.loadFromResource("classpath:/data/UpdateComment.json", Comment.class);

        pendingComment = mongoTemplate.findById("pending_comment", Comment.class);
        assertNotNull(pendingComment);

        approvedComment = mongoTemplate.findById("approved_comment", Comment.class);
        assertNotNull(approvedComment);

        rejectedComment = mongoTemplate.findById("rejected_comment", Comment.class);
        assertNotNull(rejectedComment);

        when(sp.getAuthenticatedUserId()).thenReturn("moderatorUserId");
        when(sp.hasPermission("moderatorUserId", MODERATE)).thenReturn(true);
    }

    @Test
    public void testUpdateModerationPendingToApproved() {
        Comment result = approve(pendingComment);

        assertValues(result, APPROVED, "moderatorUserId", null, null);
    }

    @Test
    public void testUpdateModerationPendingToRejected() {
        Comment result = reject(pendingComment, "rejection reason");

        assertValues(result, REJECTED, "moderatorUserId", null, "rejection reason");
    }

    @Test
    public void testUpdateModerationApprovedToPending() {
        Date lastUpdated = approvedComment.getModeration().getUpdated();
        Comment result = review(approvedComment);

        assertValues(result, Status.PENDING, "moderatorUserId", lastUpdated, null);
    }

    @Test
    public void testUpdateModerationApprovedToRejected() {

        Date lastUpdated = approvedComment.getModeration().getUpdated();
        Comment result = reject(approvedComment, "reason#2");

        assertValues(result, REJECTED, "moderatorUserId", lastUpdated, "reason#2");
    }

    @Test
    public void testUpdateModerationRejectedToPending() {
        Date lastUpdated = rejectedComment.getModeration().getUpdated();
        Comment result = review(rejectedComment);

        assertValues(result, PENDING, "moderatorUserId", lastUpdated, null);
    }

    @Test
    public void testUpdateModerationRejectedToApproved() {
        Date lastUpdated = rejectedComment.getModeration().getUpdated();
        Comment result = approve(rejectedComment);

        assertValues(result, APPROVED, "moderatorUserId", lastUpdated, null);
    }

    private void assertValues(Comment result, Status status, String moderatorId, Date lastUpdated, String reason) {
        assertEquals(status, result.getModeration().getStatus());
        assertEquals(moderatorId, result.getModeration().getModeratorId());
        assertNotNull(result.getModeration().getUpdated());
        if (lastUpdated != null) {
            assertTrue(lastUpdated.compareTo(result.getModeration().getUpdated()) < 0);
        }
        assertSame(reason, result.getModeration().getRejectionReason());
    }

    private Comment approve(Comment target) {
        Comment c = new Comment();
        c.setId(target.getId());

        Moderation m = new Moderation();
        m.setStatus(APPROVED);
        c.setModeration(m);

        Comment result = commentService.updateComment(c);
        assertEquals(target.getId(), result.getId());

        return result;
    }

    private Comment reject(Comment target, String reason) {
        Comment c = new Comment();
        c.setId(target.getId());

        Moderation m = new Moderation();
        m.setStatus(REJECTED);
        m.setRejectionReason(reason);
        c.setModeration(m);

        Comment result = commentService.updateComment(c);
        assertEquals(target.getId(), result.getId());

        return result;
    }

    private Comment review(Comment target) {
        Comment c = new Comment();
        c.setId(target.getId());

        Moderation m = new Moderation();
        m.setStatus(PENDING);
        c.setModeration(m);

        Comment result = commentService.updateComment(c);
        assertEquals(target.getId(), result.getId());

        return result;
    }
}
