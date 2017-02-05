package ru.nullpointer.nkbcomment.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
import static org.mockito.Mockito.when;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ru.nullpointer.nkbcomment.domain.Comment;
import ru.nullpointer.nkbcomment.domain.Group;
import ru.nullpointer.nkbcomment.domain.Moderation;
import ru.nullpointer.nkbcomment.domain.PostInfo;
import ru.nullpointer.nkbcomment.domain.Scope;
import ru.nullpointer.nkbcomment.security.SecurityProvider;
import static ru.nullpointer.nkbcomment.security.domain.Permission.VIEW;
import ru.nullpointer.nkbcomment.utils.CommentGenerator;

/**
 *
 * @author Maksim Konyuhov
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/spring/beans.xml", "/spring/applicationContext.xml"})
public class GetPostInfoTest {

    @Resource
    private CommentService commentService;
    //
    @Resource
    private MongoTemplate mongoTemplate;
    //
    @Resource
    private SecurityProvider sp;

    private Set<String> postIdSet;
    private List<Group> groups;

    @Before
    public void setUp() {
        mongoTemplate.dropCollection(Comment.class);
        Mockito.reset(sp);

        postIdSet = new HashSet<String>();
        postIdSet.add("post1");
        postIdSet.add("post2");

        groups = new ArrayList<Group>();
        Group group1 = new Group();
        group1.setId("group1");
        groups.add(group1);

        CommentGenerator cg = new CommentGenerator(mongoTemplate);

        Set<String> sharedGroups = new HashSet<String>();
        sharedGroups.add("group1");

        Set<String> otherSharedGroups = new HashSet<String>();
        otherSharedGroups.add("group2");

        long date = new Date().getTime();

        cg.createComment(date, "post1", "author1", Moderation.Status.APPROVED, "moderator1", Scope.Visibility.PUBLIC, null);
        cg.createComment(--date, "post1", "author1", Moderation.Status.APPROVED, "moderator1", Scope.Visibility.GROUP, sharedGroups);
        cg.createComment(--date, "post1", "author1", Moderation.Status.APPROVED, "moderator1", Scope.Visibility.PRIVATE, null);
        cg.createComment(--date, "post1", "author1", Moderation.Status.APPROVED, "moderator1", Scope.Visibility.GROUP, otherSharedGroups);
        cg.createComment(--date, "post1", "author1", Moderation.Status.REJECTED, "moderator1", Scope.Visibility.PUBLIC, null);

        cg.createComment(--date, "post2", "author1", Moderation.Status.APPROVED, "moderator1", Scope.Visibility.PUBLIC, null);
        cg.createComment(--date, "post2", "author1", Moderation.Status.PENDING, "moderator1", Scope.Visibility.PUBLIC, null);
        cg.createComment(--date, "post2", "author1", Moderation.Status.APPROVED, "moderator1", Scope.Visibility.GROUP, otherSharedGroups);
    }

    @Test
    public void testPostInfo() {
        when(sp.getAuthenticatedUserId()).thenReturn("user1");
        when(sp.hasPermission("user1", VIEW)).thenReturn(true);
        when(sp.getShareGroups("user1")).thenReturn(groups);

        List<PostInfo> postInfoList = commentService.getPostInfo(postIdSet);
        assertTrue(postInfoList.size() == 2);

        postInfoList = new ArrayList<PostInfo>(postInfoList);
        Collections.sort(postInfoList, new Comparator<PostInfo>() {

            @Override
            public int compare(PostInfo o1, PostInfo o2) {
                return o1.getPostId().compareTo(o2.getPostId());
            }
        });

        PostInfo info = postInfoList.get(0);
        assertTrue(info.getCommentCount() == 2);

        info = postInfoList.get(1);
        assertTrue(info.getCommentCount() == 1);
    }
}
