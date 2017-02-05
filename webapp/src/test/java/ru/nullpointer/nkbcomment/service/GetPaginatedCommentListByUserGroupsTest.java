package ru.nullpointer.nkbcomment.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.annotation.Resource;
import static org.junit.Assert.assertTrue;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ru.nullpointer.nkbcomment.domain.Comment;
import ru.nullpointer.nkbcomment.domain.Group;
import ru.nullpointer.nkbcomment.domain.Moderation;
import ru.nullpointer.nkbcomment.security.SecurityProvider;
import static ru.nullpointer.nkbcomment.domain.Moderation.Status.*;
import static ru.nullpointer.nkbcomment.domain.Scope.Visibility.*;
import static ru.nullpointer.nkbcomment.security.domain.Permission.*;
import ru.nullpointer.nkbcomment.support.PaginatedQueryResult;
import ru.nullpointer.nkbcomment.utils.CommentGenerator;

/**
 *
 * @author Maksim Konyuhov
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/spring/beans.xml", "/spring/applicationContext.xml"})
public class GetPaginatedCommentListByUserGroupsTest {

    @Resource
    private CommentService commentService;
    //
    @Resource
    private MongoTemplate mongoTemplate;
    //
    @Resource
    private SecurityProvider sp;

    private List<Group> groupList;
    private Set<String> groupIds;

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

        groupList = new ArrayList<Group>();

        Group g = new Group();
        g.setId("group1");
        g.setName("Группа1");
        groupList.add(g);

        g = new Group();
        g.setId("group2");
        g.setName("Группа2");
        groupList.add(g);

        groupIds = extractGroupIds(groupList);
    }

    @Test
    public void testResult() {
        when(sp.getAuthenticatedUserId()).thenReturn("user1");
        when(sp.hasPermission("user1", VIEW)).thenReturn(true);
        when(sp.getShareGroups("user1")).thenReturn(groupList);

        PaginatedQueryResult<Comment> result =
                commentService.getPaginatedCommentListByUserGroups(1, 5, null);

        verify(sp).hasPermission("user1", VIEW);

        List<Comment> comments = result.getList();
        assertTrue(!comments.isEmpty());

        Date prev = comments.get(0).getCreated();

        for (Comment c : comments) {
            assertTrue(c.getModeration().getStatus() == Moderation.Status.APPROVED);
            assertTrue(prev.compareTo(c.getCreated()) >= 0);
            prev = c.getCreated();

            assertTrue(groupIds.containsAll(c.getScope().getShareGroups()));
            assertTrue(!Collections.disjoint(groupIds, c.getScope().getShareGroups()));
        }
    }

    private Set<String> extractGroupIds(List<Group> groups) {
        Set<String> result = new HashSet<String>();

        for (Group group : groups) {
            result.add(group.getId());
        }

        return result;
    }
}
