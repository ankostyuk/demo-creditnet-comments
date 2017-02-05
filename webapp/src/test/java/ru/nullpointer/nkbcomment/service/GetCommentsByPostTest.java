package ru.nullpointer.nkbcomment.service;

import java.util.*;
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
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ru.nullpointer.nkbcomment.domain.Comment;
import static ru.nullpointer.nkbcomment.domain.Moderation.Status.*;
import ru.nullpointer.nkbcomment.domain.Post;
import ru.nullpointer.nkbcomment.domain.Scope;
import static ru.nullpointer.nkbcomment.domain.Scope.Visibility.*;
import ru.nullpointer.nkbcomment.security.SecurityProvider;
import ru.nullpointer.nkbcomment.utils.AtLeastOneChecker;
import ru.nullpointer.nkbcomment.utils.CommentGenerator;
import static ru.nullpointer.nkbcomment.security.domain.Permission.*;
import ru.nullpointer.nkbcomment.support.PaginatedQueryResult;

/**
 *
 * @author Alexander Yastrebov
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/spring/beans.xml", "/spring/applicationContext.xml"})
public class GetCommentsByPostTest {

    private Logger logger = LoggerFactory.getLogger(GetCommentsByPostTest.class);
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
    public void testNonExistingPost() {
        when(sp.getAuthenticatedUserId()).thenReturn("user1");
        when(sp.hasPermission("user1", VIEW)).thenReturn(true);

        List<Post> posts = commentService.getCommentsByPost(Collections.singleton("non_existing_post"), null);

        assertTrue(posts.isEmpty());
    }

    @Test
    public void testPublicAuthorNoGroups() {
        when(sp.getAuthenticatedUserId()).thenReturn("user1");
        when(sp.hasPermission("user1", VIEW)).thenReturn(true);

        List<Post> posts = commentService.getCommentsByPost(Collections.singleton("post1"), null);

        verify(sp).hasPermission("user1", VIEW);

        assertEquals(1, posts.size());
        Post p = posts.get(0);
        assertTrue(p.getComments().size() > 1);

        AtLeastOneChecker checker = new AtLeastOneChecker()//
                .expect("my")//
                .expect("others")//
                .expect("myApproved")//
                .expect("othersApproved")//
                .expect("othersApproved")//
                .expect("pending")//
                .expect("rejected")//
                .expect("private")//
                .expect("group")//
                .expect("myPublic")//
                .expect("othersPublic");

        Date prev = p.getComments().get(0).getCreated();
        for (Comment c : p.getComments()) {
            logger.debug("Comment: {}", c);

            assertEquals("post1", c.getPostId());

            assertTrue(c.getCreated().compareTo(prev) >= 0);
            prev = c.getCreated();

            checker.meet(c.getAuthorId().equals("user1") ? "my" : "others");

            switch (c.getModeration().getStatus()) {
                case APPROVED:
                    checker.meet(c.getAuthorId().equals("user1") ? "myApproved" : "othersApproved");
                    break;

                case PENDING:
                    assertEquals("user1", c.getAuthorId());
                    checker.meet("pending");
                    break;

                case REJECTED:
                    assertEquals("user1", c.getAuthorId());
                    checker.meet("rejected");
                    break;

                default:
                    fail("Unknown moderation status: " + c.getModeration().getStatus());
            }

            switch (c.getScope().getVisibility()) {
                case PRIVATE:
                    assertEquals("user1", c.getAuthorId());
                    checker.meet("private");
                    break;

                case GROUP:
                    assertEquals("user1", c.getAuthorId());
                    checker.meet("group");
                    break;

                case PUBLIC:
                    if (c.getModeration().getStatus() != APPROVED) {
                        assertEquals("user1", c.getAuthorId());
                    }
                    checker.meet(c.getAuthorId().equals("user1") ? "myPublic" : "othersPublic");
                    break;

                default:
                    fail("Unknown scope visibility: " + c.getScope().getVisibility());
            }
        }
        checker.check();
    }

    @Test
    public void testPublicNotAuthorNoGroups() {
        when(sp.getAuthenticatedUserId()).thenReturn("userWithNoComments");
        when(sp.hasPermission("userWithNoComments", VIEW)).thenReturn(true);

        List<Post> posts = commentService.getCommentsByPost(Collections.singleton("post1"), null);

        verify(sp).hasPermission("userWithNoComments", VIEW);

        assertEquals(1, posts.size());
        Post p = posts.get(0);
        assertTrue(p.getComments().size() > 1);
        for (Comment c : p.getComments()) {
            assertEquals("post1", c.getPostId());

            assertEquals(APPROVED, c.getModeration().getStatus());
            assertEquals(PUBLIC, c.getScope().getVisibility());
        }
    }

    @Test
    public void testPublicPostIdPrefixNotAuthorNoGroups() {
        when(sp.getAuthenticatedUserId()).thenReturn("userWithNoComments");
        when(sp.hasPermission("userWithNoComments", VIEW)).thenReturn(true);

        Set<String> postIdPrefixSet = new HashSet<String>();
        postIdPrefixSet.add("post");
        postIdPrefixSet.add("someOtherPrefix");

        List<Post> posts = commentService.getCommentsByPostPrefix(postIdPrefixSet, null);

        verify(sp).hasPermission("userWithNoComments", VIEW);

        assertEquals(2, posts.size());
        for (Post p : posts) {
            assertTrue(p.getId().startsWith("post"));

            for (Comment c : p.getComments()) {
                assertEquals(APPROVED, c.getModeration().getStatus());
                assertEquals(PUBLIC, c.getScope().getVisibility());
            }
        }
    }

    @Test
    public void testSorting() {
        when(sp.getAuthenticatedUserId()).thenReturn("user1");
        when(sp.hasPermission("user1", VIEW)).thenReturn(true);

        List<Post> posts = commentService.getCommentsByPost(new HashSet<String>(Arrays.asList("post1", "post2")), null);
        assertNotNull(posts);
        assertEquals(2, posts.size());

        assertValidPost(posts.get(0), true);
        assertValidPost(posts.get(1), true);
    }

    @Test
    public void testPaginatedPostIdWithTags() {
        when(sp.getAuthenticatedUserId()).thenReturn("user1");
        when(sp.hasPermission("user1", VIEW)).thenReturn(true);
        when(sp.hasPermission("user1", CREATE)).thenReturn(true);

        Scope s = new Scope();
        s.setVisibility(PRIVATE);

        Comment c1 = new Comment();
        c1.setPostId("postId");
        c1.setContent("content");
        c1.setTags(new HashSet<String>(Arrays.asList("tag1", "tag2")));
        c1.setScope(s);

        Comment c2 = new Comment();
        c2.setPostId("postId");
        c2.setContent("content");
        c2.setTags(new HashSet<String>(Arrays.asList("tag2", "tag3")));
        c2.setScope(s);

        commentService.addComment(c1);
        commentService.addComment(c2);

        PaginatedQueryResult<Comment> result = commentService.getPaginatedCommentListByPost("postId", new HashSet<String>(Arrays.asList("tag2", "tag3")), 1, 5);
        List<Comment> comments = result.getList();
        assertEquals(1, comments.size());
        assertEquals(new HashSet<String>(Arrays.asList("tag2", "tag3")), comments.get(0).getTags());
    }

    private void assertValidPost(Post post, boolean createdAscending) {
        Date prevCreated = new Date(0);
        for (Comment c : post.getComments()) {
            assertEquals(post.getId(), c.getPostId());

            int cmp = c.getCreated().compareTo(prevCreated);
            if (createdAscending) {
                assertTrue(cmp >= 0);
            } else {
                assertTrue(cmp <= 0);
            }
            prevCreated = c.getCreated();
        }
    }
}
