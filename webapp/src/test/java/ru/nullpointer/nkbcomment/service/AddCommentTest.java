package ru.nullpointer.nkbcomment.service;

import javax.annotation.Resource;
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
import org.springframework.security.access.AccessDeniedException;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ru.nullpointer.nkbcomment.domain.Comment;
import static ru.nullpointer.nkbcomment.domain.Moderation.Status.*;
import ru.nullpointer.nkbcomment.domain.Scope;
import static ru.nullpointer.nkbcomment.domain.Scope.Visibility.*;
import static ru.nullpointer.nkbcomment.security.domain.Permission.*;
import ru.nullpointer.nkbcomment.security.SecurityProvider;

/**
 *
 * @author Alexander Yastrebov
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/spring/beans.xml", "/spring/applicationContext.xml"})
public class AddCommentTest {

    private Logger logger = LoggerFactory.getLogger(AddCommentTest.class);
    //
    @Resource
    private CommentService commentService;
    //
    @Resource
    private MongoTemplate mongoTemplate;
    //
    @Resource
    private SecurityProvider sp;

    @Before
    public void setUp() {
        mongoTemplate.dropCollection(Comment.class);
        Mockito.reset(sp);
    }

    @Test
    public void testNormal() {
        when(sp.getAuthenticatedUserId()).thenReturn("user1");
        when(sp.hasPermission("user1", CREATE)).thenReturn(true);

        Comment c = new Comment();
        c.setPostId("post1");
        c.setContent("content test");

        Scope s = new Scope();
        s.setVisibility(PRIVATE);
        c.setScope(s);

        Comment result = commentService.addComment(c);

        verify(sp).hasPermission("user1", CREATE);

        assertNotNull(result.getId());
        assertEquals(c.getPostId(), result.getPostId());
        assertEquals("user1", result.getAuthorId());
        assertNotNull(result.getCreated());
        assertEquals(c.getContent(), result.getContent());
        assertNull(result.getEdited());
        assertEquals(PENDING, result.getModeration().getStatus());
        assertNull(result.getModeration().getModeratorId());
        assertNull(result.getModeration().getRejectionReason());
        assertNull(result.getModeration().getUpdated());
    }

    @Test(expected = AccessDeniedException.class)
    public void testNoPermission() {
        when(sp.getAuthenticatedUserId()).thenReturn("user1");
        when(sp.hasPermission("user1", CREATE)).thenReturn(false);

        Comment c = new Comment();
        c.setPostId("post2");
        c.setContent("content test2");

        commentService.addComment(c);
    }

    @Test
    public void testBadArguments() {
        when(sp.getAuthenticatedUserId()).thenReturn("user1");
        when(sp.hasPermission("user1", CREATE)).thenReturn(true);

        Comment c = new Comment();
        try {
            commentService.addComment(c);
            fail();
        } catch (BadArgumentException e) {
        }

        try {
            c.setPostId("post3");
            commentService.addComment(c);
            fail();
        } catch (BadArgumentException e) {
        }

        c.setContent("content test3");

        Scope s = new Scope();
        s.setVisibility(PRIVATE);
        c.setScope(s);

        // Comment is now valid
        commentService.addComment(c);
    }

    @Test
    public void testTitle() {
        when(sp.getAuthenticatedUserId()).thenReturn("user1");
        when(sp.hasPermission("user1", CREATE)).thenReturn(true);

        Comment c = new Comment();
        c.setPostId("post1");
        c.setContent("test");
        c.setTitle("Company Name");

        Scope s = new Scope();
        s.setVisibility(PRIVATE);
        c.setScope(s);

        Comment result = commentService.addComment(c);
        assertEquals("Company Name", result.getTitle());
    }
}
