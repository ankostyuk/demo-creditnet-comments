package ru.nullpointer.nkbcomment.service;

import java.util.List;
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
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ru.nullpointer.nkbcomment.domain.Comment;
import static ru.nullpointer.nkbcomment.domain.Moderation.Status.*;
import static ru.nullpointer.nkbcomment.domain.Scope.Visibility.*;
import ru.nullpointer.nkbcomment.security.SecurityProvider;
import ru.nullpointer.nkbcomment.utils.CommentGenerator;
import static ru.nullpointer.nkbcomment.security.domain.Permission.*;

/**
 *
 * @author Alexander Yastrebov
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/spring/beans.xml", "/spring/applicationContext.xml"})
public class GetCommentsByAuthorTest {

    private Logger logger = LoggerFactory.getLogger(GetCommentsByAuthorTest.class);
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

        CommentGenerator cg = new CommentGenerator(mongoTemplate);
        cg.generate(
                cg.str("post1", "post2"),
                cg.str("user1", "user2"),
                cg.st(PENDING, APPROVED, REJECTED),
                cg.str("moderator1", "moderator2"),
                cg.vs(PRIVATE, GROUP, PUBLIC),
                cg.strset(cg.set("group1"), cg.set("group1", "group2"), cg.set("group3"))//
                );
    }

    @Test
    public void testNoComments() {
        when(sp.getAuthenticatedUserId()).thenReturn("notAuthor");
        when(sp.hasPermission("notAuthor", VIEW)).thenReturn(true);

        List<Comment> list = commentService.getCommentsByAuthor(null, null, 10, null);

        verify(sp).hasPermission("notAuthor", VIEW);

        assertTrue(list.isEmpty());
    }

    @Test
    public void testNormal() {
        when(sp.getAuthenticatedUserId()).thenReturn("user1");
        when(sp.hasPermission("user1", VIEW)).thenReturn(true);

        List<Comment> list = commentService.getCommentsByAuthor(null, null, 10, null);

        verify(sp).hasPermission("user1", VIEW);
        assertEquals(10, list.size());

        Comment prev = list.get(0);
        for (Comment c : list) {
            assertEquals("user1", c.getAuthorId());
            assertTrue(c.getCreated().compareTo(prev.getCreated()) >= 0);
            prev = c;
        }

        // paging
        list = commentService.getCommentsByAuthor(prev.getCreated(), prev.getId(), 10, null);
        assertEquals(10, list.size());
        for (Comment c : list) {
            assertEquals("user1", c.getAuthorId());
            assertTrue(c.getCreated().compareTo(prev.getCreated()) >= 0);
            prev = c;
        }
    }
}
