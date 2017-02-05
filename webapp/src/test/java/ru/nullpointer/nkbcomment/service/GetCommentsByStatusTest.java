package ru.nullpointer.nkbcomment.service;

import java.util.*;
import javax.annotation.Resource;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
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
public class GetCommentsByStatusTest {

    private Logger logger = LoggerFactory.getLogger(GetCommentsByStatusTest.class);
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

    @Before
    public void setUp() {
        mongoTemplate.dropCollection(Comment.class);
        Mockito.reset(sp);

        mongoUtils.loadFromResource("classpath:/data/GetCommentsByStatus.json", Comment.class);
    }

    @Test
    public void testNoStatusNoDate() {
        when(sp.getAuthenticatedUserId()).thenReturn("moderatorId");
        when(sp.hasPermission("moderatorId", MODERATE)).thenReturn(true);

        final int limit = 100;
        List<Comment> result = commentService.getCommentsByStatus(null, null, null, limit, null);

        assertTrue(result.size() <= limit);
        assertTrue(result.size() > 1);

        Set<Status> metStatuses = new HashSet<Status>();

        Iterator<Comment> it = result.iterator();
        Comment prev = it.next();
        metStatuses.add(prev.getModeration().getStatus());

        while (it.hasNext()) {
            Comment curr = it.next();
            checkOrder(prev, curr);
            metStatuses.add(curr.getModeration().getStatus());

            prev = curr;
        }
        assertTrue(metStatuses.size() == Status.values().length);
    }

    @Test
    public void testStatusNoDate() {
        when(sp.getAuthenticatedUserId()).thenReturn("moderatorId");
        when(sp.hasPermission("moderatorId", MODERATE)).thenReturn(true);

        final int limit = 100;
        final Status status = PENDING;

        List<Comment> result = commentService.getCommentsByStatus(status, null, null, limit, null);

        assertTrue(result.size() <= limit);
        assertTrue(result.size() > 1);

        Iterator<Comment> it = result.iterator();
        Comment prev = it.next();
        assertEquals(status, prev.getModeration().getStatus());
        while (it.hasNext()) {
            Comment curr = it.next();
            checkOrder(prev, curr);
            assertEquals(status, curr.getModeration().getStatus());

            prev = curr;
        }
    }

    @Test
    public void testNoStatusDate() {
        when(sp.getAuthenticatedUserId()).thenReturn("moderatorId");
        when(sp.hasPermission("moderatorId", MODERATE)).thenReturn(true);

        final int limit = 100;
        final Date startDate = javax.xml.bind.DatatypeConverter.parseDateTime("2011-11-27T18:16:52.980Z").getTime();

        List<Comment> result = commentService.getCommentsByStatus(null, startDate, null, limit, null);

        assertTrue(result.size() <= limit);
        assertTrue(result.size() > 1);

        Iterator<Comment> it = result.iterator();
        Comment prev = it.next();
        assertTrue(prev.getCreated().compareTo(startDate) >= 0);
        while (it.hasNext()) {
            Comment curr = it.next();
            checkOrder(prev, curr);

            prev = curr;
        }
    }

    private void checkOrder(Comment prev, Comment curr) {
        Date prevDate = prev.getCreated();
        Date currDate = curr.getCreated();

        int dateOrder = currDate.compareTo(prevDate);
        if (dateOrder == 0) {
            // same date. check id ordering
            assertTrue(curr.getId().compareTo(prev.getId()) > 0);
        } else {
            assertTrue(dateOrder > 0);
        }
    }
}
