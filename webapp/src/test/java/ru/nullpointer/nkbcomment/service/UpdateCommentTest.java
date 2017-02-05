package ru.nullpointer.nkbcomment.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.annotation.Resource;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import static org.mockito.Mockito.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ru.nullpointer.nkbcomment.domain.Comment;
import ru.nullpointer.nkbcomment.domain.Group;
import static ru.nullpointer.nkbcomment.domain.Moderation.Status.*;
import ru.nullpointer.nkbcomment.domain.Scope;
import static ru.nullpointer.nkbcomment.domain.Scope.Visibility.*;
import ru.nullpointer.nkbcomment.domain.Verification;
import ru.nullpointer.nkbcomment.security.SecurityProvider;
import ru.nullpointer.nkbcomment.utils.MongoUtils;
import static ru.nullpointer.nkbcomment.security.domain.Permission.*;

/**
 *
 * @author Alexander Yastrebov
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/spring/beans.xml", "/spring/applicationContext.xml"})
public class UpdateCommentTest {

    private Logger logger = LoggerFactory.getLogger(UpdateCommentTest.class);
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
    }

    @Test(expected = NotFoundException.class)
    public void testNotFound() {
        Comment c = new Comment();
        c.setId("invalid id");
        c.setContent("updated content");

        commentService.updateComment(c);
    }

    @Test
    public void testUpdateContentPending() {
        when(sp.getAuthenticatedUserId()).thenReturn("authorUserId");
        when(sp.hasPermission("authorUserId", EDIT)).thenReturn(true);

        Comment c = new Comment();
        c.setId(pendingComment.getId());
        c.setContent("updated content");

        Comment result = commentService.updateComment(c);

        assertEquals(c.getId(), result.getId());
        assertEquals(c.getContent(), result.getContent());
        assertNotSame(pendingComment.getEdited(), result.getEdited());

        assertSame(PENDING, result.getModeration().getStatus());
        assertNull(result.getModeration().getModeratorId());
        assertNull(result.getModeration().getRejectionReason());
        assertNull(result.getModeration().getUpdated());

        assertFalse(result.getVerification().isVerified());
        assertNull(result.getVerification().getVerifierId());
        assertNull(result.getVerification().getUpdated());
    }

    @Test(expected = AccessDeniedException.class)
    public void testUpdateContentApproved() {
        when(sp.getAuthenticatedUserId()).thenReturn("authorUserId");
        when(sp.hasPermission("authorUserId", EDIT)).thenReturn(true);

        Comment c = new Comment();
        c.setId(approvedComment.getId());
        c.setContent("updated content");

        commentService.updateComment(c);
    }

    @Test
    public void testUpdateContentRejected() {
        when(sp.getAuthenticatedUserId()).thenReturn("authorUserId");
        when(sp.hasPermission("authorUserId", EDIT)).thenReturn(true);

        Comment c = new Comment();
        c.setId(rejectedComment.getId());
        c.setContent("updated content");

        Comment result = commentService.updateComment(c);

        assertEquals(c.getId(), result.getId());
        assertEquals(c.getContent(), result.getContent());
        assertNotSame(rejectedComment.getEdited(), result.getEdited());

        assertSame(PENDING, result.getModeration().getStatus());
        assertNull(result.getModeration().getModeratorId());
        assertNull(result.getModeration().getRejectionReason());
        assertNull(result.getModeration().getUpdated());

        assertFalse(result.getVerification().isVerified());
        assertNull(result.getVerification().getVerifierId());
        assertNull(result.getVerification().getUpdated());
    }

    @Test(expected = AccessDeniedException.class)
    public void testUpdateContentNotAuthor() {
        when(sp.getAuthenticatedUserId()).thenReturn("user2");

        Comment c = new Comment();
        c.setId(pendingComment.getId());
        c.setContent("updated content");

        commentService.updateComment(c);
    }

    @Test(expected = AccessDeniedException.class)
    public void testUpdateContentNoPermission() {
        when(sp.getAuthenticatedUserId()).thenReturn("noPermissionUserId");

        Comment c = new Comment();
        c.setId(pendingComment.getId());
        c.setContent("updated content");

        commentService.updateComment(c);
    }

    @Test
    public void testUpdateVerifyTrue() {
        when(sp.getAuthenticatedUserId()).thenReturn("verifierId");
        when(sp.hasPermission("verifierId", VERIFY)).thenReturn(true);

        Comment c = new Comment();
        c.setId(pendingComment.getId());
        Verification v = new Verification();
        v.setVerified(true);
        c.setVerification(v);

        Comment result = commentService.updateComment(c);

        assertEquals(c.getId(), result.getId());
        assertTrue(result.getVerification().isVerified());
        assertEquals("verifierId", result.getVerification().getVerifierId());
        assertNotNull(result.getVerification().getUpdated());
    }

    @Test
    public void testUpdateVerifyFalse() {
        when(sp.getAuthenticatedUserId()).thenReturn("verifierId");
        when(sp.hasPermission("verifierId", VERIFY)).thenReturn(true);

        Comment c = new Comment();
        c.setId(approvedComment.getId());
        Verification v = new Verification();
        v.setVerified(false);
        c.setVerification(v);

        Comment result = commentService.updateComment(c);

        assertEquals(c.getId(), result.getId());
        assertFalse(result.getVerification().isVerified());
        assertEquals("verifierId", result.getVerification().getVerifierId());
        assertNotNull(result.getVerification().getUpdated());
    }

    @Test
    public void testUpdateScopePrivate() {
        when(sp.getAuthenticatedUserId()).thenReturn("authorUserId");
        when(sp.hasPermission("authorUserId", EDIT_SCOPE)).thenReturn(true);

        Comment c = new Comment();
        c.setId(approvedComment.getId());
        Scope s = new Scope();
        s.setVisibility(PRIVATE);
        c.setScope(s);

        Comment result = commentService.updateComment(c);

        assertEquals(c.getId(), result.getId());
        assertNotNull(result.getScope());
        assertEquals(PRIVATE, result.getScope().getVisibility());
        assertNull(result.getScope().getShareGroups());
    }

    @Test
    public void testUpdateScopePublic() {
        when(sp.getAuthenticatedUserId()).thenReturn("authorUserId");
        when(sp.hasPermission("authorUserId", EDIT_SCOPE)).thenReturn(true);

        Comment c = new Comment();
        c.setId(approvedComment.getId());
        Scope s = new Scope();
        s.setVisibility(PUBLIC);
        c.setScope(s);

        Comment result = commentService.updateComment(c);

        assertEquals(c.getId(), result.getId());
        assertNotNull(result.getScope());
        assertEquals(PUBLIC, result.getScope().getVisibility());
        assertNull(result.getScope().getShareGroups());
    }

    @Test
    public void testUpdateScopeOneGroup() {
        when(sp.getAuthenticatedUserId()).thenReturn("authorUserId");
        when(sp.hasPermission("authorUserId", EDIT_SCOPE)).thenReturn(true);

        List<Group> groupList = new ArrayList<Group>();
        Group g = new Group();
        g.setId("group1");
        g.setName("Группа1");
        groupList.add(g);

        g = new Group();
        g.setId("group2");
        g.setName("Группа2");
        groupList.add(g);

        when(sp.getShareGroups("authorUserId")).thenReturn(groupList);

        Comment c = new Comment();
        c.setId(approvedComment.getId());
        Scope s = new Scope();
        s.setVisibility(GROUP);

        Set<String> groups = new HashSet<String>();
        groups.add("group1");
        s.setShareGroups(groups);
        c.setScope(s);

        Comment result = commentService.updateComment(c);

        assertEquals(c.getId(), result.getId());
        assertNotNull(result.getScope());
        assertEquals(GROUP, result.getScope().getVisibility());
        assertEquals(1, result.getScope().getShareGroups().size());
        assertTrue(result.getScope().getShareGroups().contains("group1"));
    }

    @Test
    public void testUpdateScopeGroups() {
        when(sp.getAuthenticatedUserId()).thenReturn("authorUserId");
        when(sp.hasPermission("authorUserId", EDIT_SCOPE)).thenReturn(true);

        List<Group> groupList = new ArrayList<Group>();
        Group g = new Group();
        g.setId("group1");
        g.setName("Группа1");
        groupList.add(g);

        g = new Group();
        g.setId("group2");
        g.setName("Группа2");
        groupList.add(g);

        g = new Group();
        g.setId("group3");
        g.setName("Группа3");
        groupList.add(g);

        when(sp.getShareGroups("authorUserId")).thenReturn(groupList);

        Comment c = new Comment();
        c.setId(approvedComment.getId());
        Scope s = new Scope();
        s.setVisibility(GROUP);

        Set<String> groups = new HashSet<String>();
        groups.add("group1");
        groups.add("group3");
        s.setShareGroups(groups);
        c.setScope(s);

        Comment result = commentService.updateComment(c);

        assertEquals(c.getId(), result.getId());
        assertNotNull(result.getScope());
        assertEquals(GROUP, result.getScope().getVisibility());
        assertEquals(2, result.getScope().getShareGroups().size());
        assertTrue(result.getScope().getShareGroups().contains("group1"));
        assertTrue(result.getScope().getShareGroups().contains("group3"));
    }

    @Test
    public void testUpdateTags() {
        when(sp.getAuthenticatedUserId()).thenReturn("authorUserId");
        when(sp.hasPermission("authorUserId", EDIT)).thenReturn(true);

        Comment c = new Comment();
        c.setId(pendingComment.getId());
        c.setTags(new HashSet<String>(Arrays.asList("tag1", "tag2")));

        Comment result = commentService.updateComment(c);

        assertEquals(c.getTags(), result.getTags());
    }

    @Test
    public void testRemoveTags() {
        when(sp.getAuthenticatedUserId()).thenReturn("authorUserId");
        when(sp.hasPermission("authorUserId", CREATE)).thenReturn(true);
        when(sp.hasPermission("authorUserId", EDIT)).thenReturn(true);

        Comment c = new Comment();
        c.setId("id1");
        c.setPostId("postId");
        c.setContent("content");
        c.setTags(new HashSet<String>(Arrays.asList("tag1", "tag2")));
        Scope s = new Scope();
        s.setVisibility(PRIVATE);
        c.setScope(s);

        Comment stored = commentService.addComment(c);

        c = new Comment();
        c.setId(stored.getId());
        c.setRemoveTags(Boolean.TRUE);

        Comment result = commentService.updateComment(c);
        assertEquals(null, result.getTags());
    }
}
