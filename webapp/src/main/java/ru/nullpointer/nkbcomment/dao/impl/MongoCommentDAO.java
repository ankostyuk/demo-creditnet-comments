package ru.nullpointer.nkbcomment.dao.impl;

import org.bson.types.ObjectId;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.index.Index;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.util.Assert;
import ru.nullpointer.nkbcomment.dao.CommentDAO;
import ru.nullpointer.nkbcomment.domain.Comment;
import ru.nullpointer.nkbcomment.domain.Moderation.Status;
import ru.nullpointer.nkbcomment.support.PageConfig;
import ru.nullpointer.nkbcomment.support.PaginatedQueryResult;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;
import org.springframework.data.domain.Sort;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Query.query;
import static org.springframework.data.domain.Sort.Direction.ASC;
import static org.springframework.data.domain.Sort.Direction.DESC;
import static org.springframework.data.mongodb.core.aggregation.Aggregation.*;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import static ru.nullpointer.nkbcomment.domain.Moderation.Status.APPROVED;
import ru.nullpointer.nkbcomment.domain.PostInfo;
import static ru.nullpointer.nkbcomment.domain.Scope.Visibility.GROUP;
import static ru.nullpointer.nkbcomment.domain.Scope.Visibility.PUBLIC;

/**
 *
 * @author Alexander Yastrebov
 */
public class MongoCommentDAO implements CommentDAO, InitializingBean {

    private Logger logger = LoggerFactory.getLogger(MongoCommentDAO.class);
    //
    @Resource
    private MongoTemplate mongoTemplate;

    @Override
    public Comment getById(String id) {
        Assert.hasText(id);
        return mongoTemplate.findById(id, Comment.class);
    }

    @Override
    public void insert(Comment comment) {
        Assert.notNull(comment);
        comment.setId(null);
        mongoTemplate.insert(comment);
    }

    @Override
    public void update(Comment comment) {
        Assert.notNull(comment);
        Assert.hasText(comment.getId());
        mongoTemplate.save(comment);
    }

    @Override
    public void delete(String id) {
        Assert.hasText(id);
        mongoTemplate.remove(query(where("id").is(id)), Comment.class);
    }

    @Override
    public Comment getPublicById(String id, String userId, Set<String> shareGroups) {
        Assert.hasText(id);
        Assert.hasText(userId);

        Query q = query(where("id").is(id));

        q.addCriteria(filterPublic(userId, shareGroups));

        return mongoTemplate.findOne(q, Comment.class);
    }

    @Override
    public List<Comment> getListByPostIdSet(Set<String> postIdSet, Set<String> tags) {
        Assert.isTrue(!postIdSet.isEmpty());

        Query q = query(where("postId").in(postIdSet));
        q = withTags(q, tags);

        sortByPostIdAndCreated(q, ASC);

        return mongoTemplate.find(q, Comment.class);
    }

    @Override
    public List<Comment> getPublicListByPostIdSet(Set<String> postIdSet, String userId, Set<String> shareGroups, Set<String> tags) {
        Assert.isTrue(!postIdSet.isEmpty());
        Assert.hasText(userId);
        Assert.notNull(shareGroups);

        Query q = query(where("postId").in(postIdSet));
        q = withTags(q, tags);

        q.addCriteria(filterPublic(userId, shareGroups));

        sortByPostIdAndCreated(q, ASC);

        return mongoTemplate.find(q, Comment.class);
    }

    @Override
    public List<PostInfo> getPostInfoByPostIdSet(Set<String> postIdSet) {
        Assert.isTrue(!postIdSet.isEmpty());

        Aggregation agg = Aggregation.newAggregation(
                match(where("postId").in(postIdSet)),
                group("postId").count().as("commentCount"),
                project("commentCount").and("postId").previousOperation());

        AggregationResults<PostInfo> aggregate = mongoTemplate.aggregate(agg, Comment.class, PostInfo.class);
        return aggregate.getMappedResults();
    }

    @Override
    public List<PostInfo> getPublicPostInfoByPostIdSet(Set<String> postIdSet, String userId, Set<String> shareGroups) {
        Assert.isTrue(!postIdSet.isEmpty());

        Aggregation agg = Aggregation.newAggregation(
                match(where("postId").in(postIdSet).andOperator(filterPublic(userId, shareGroups))),
                group("postId").count().as("commentCount"),
                project("commentCount").and("postId").previousOperation());

        AggregationResults<PostInfo> aggregate = mongoTemplate.aggregate(agg, Comment.class, PostInfo.class);
        return aggregate.getMappedResults();
    }

    @Override
    public PaginatedQueryResult<Comment> getPaginatedListByPostId(
            String postId,
            PageConfig pageConfig,
            Set<String> tags) {
        Assert.hasText(postId);
        Assert.notNull(pageConfig);

        Query q = query(where("postId").is(postId));
        q = withTags(q, tags);

        sortByPostIdAndCreated(q, DESC);

        long total = mongoTemplate.count(q, Comment.class);

        paginatedQuery(q, pageConfig);
        List<Comment> list = mongoTemplate.find(q, Comment.class);

        return new PaginatedQueryResult<Comment>(pageConfig, list, total);
    }

    @Override
    public PaginatedQueryResult<Comment> getPublicPaginatedListByPostId(
            String postId,
            PageConfig pageConfig,
            String userId,
            Set<String> shareGroups,
            Set<String> tags) {
        Assert.hasText(postId);
        Assert.notNull(pageConfig);
        Assert.hasText(userId);
        Assert.notNull(shareGroups);

        Query q = query(where("postId").is(postId));
        q = withTags(q, tags);

        q.addCriteria(filterPublic(userId, shareGroups));

        sortByPostIdAndCreated(q, DESC);

        long total = mongoTemplate.count(q, Comment.class);

        paginatedQuery(q, pageConfig);
        List<Comment> list = mongoTemplate.find(q, Comment.class);

        return new PaginatedQueryResult<Comment>(pageConfig, list, total);
    }

    @Override
    public PaginatedQueryResult<Comment> getPaginatedListByUserGroups(PageConfig pageConfig, Set<String> shareGroups, Set<String> tags) {
        Assert.notNull(pageConfig);
        Assert.notNull(shareGroups);

        Query q = query(where("scope.visibility").is(GROUP.toString()).and("scope.shareGroups").in(shareGroups));
        q.addCriteria(moderationCriteria());
        q = withTags(q, tags);

        sortByCreatedAndId(q, DESC);

        long total = mongoTemplate.count(q, Comment.class);

        paginatedQuery(q, pageConfig);
        List<Comment> list = mongoTemplate.find(q, Comment.class);

        return new PaginatedQueryResult<Comment>(pageConfig, list, total);
    }

    @Override
    public List<Comment> getListByPostIdPrefixSet(Set<String> postIdPrefixSet, Set<String> tags) {
        Assert.isTrue(!postIdPrefixSet.isEmpty());

        Query q = query(wherePostIdPrefixIn(postIdPrefixSet));
        q = withTags(q, tags);

        sortByPostIdAndCreated(q, ASC);

        return mongoTemplate.find(q, Comment.class);
    }

    @Override
    public List<Comment> getPublicListByPostIdPrefixSet(Set<String> postIdPrefixSet, String userId, Set<String> shareGroups, Set<String> tags) {
        Assert.isTrue(!postIdPrefixSet.isEmpty());
        Assert.hasText(userId);
        Assert.notNull(shareGroups);

        //
        // Т.к. методы wherePostIdPrefixIn и filterPublic реализованы при помощи
        // оператора $or, а spring-data-mongo не позволяет сконструировать
        // запрос с несколькими условиями (критериями) с одинаковыми ключами, то
        // объединяем условия по $and
        // https://jira.springsource.org/browse/DATAMONGO-299
        //
        Criteria postIdPrefixIn = wherePostIdPrefixIn(postIdPrefixSet);
        Criteria publicFilter = filterPublic(userId, shareGroups);

        Query q = query(new Criteria().andOperator(postIdPrefixIn, publicFilter));
        q = withTags(q, tags);

        sortByPostIdAndCreated(q, ASC);

        return mongoTemplate.find(q, Comment.class);
    }

    @Override
    public List<Comment> getListByStatus(Status status, Date startDate, String startId, int limit, Set<String> tags) {
        Query q = new Query();
        if (status != null) {
            q.addCriteria(where("moderation.status").is(status.toString()));
        }
        q = withTags(q, tags);
        filterCreatedAfter(q, startDate, startId);

        q.limit(limit);

        sortByCreatedAndId(q, ASC);

        return mongoTemplate.find(q, Comment.class);
    }

    @Override
    public List<Comment> getListByAuthor(String userId, Date startDate, String startId, int limit, Set<String> tags) {
        Assert.hasText(userId);
        Query q = query(where("authorId").is(userId));
        q = withTags(q, tags);

        filterCreatedAfter(q, startDate, startId);

        q.limit(limit);

        sortByCreatedAndId(q, ASC);

        return mongoTemplate.find(q, Comment.class);
    }

    private void filterCreatedAfter(Query q, Date startDate, String startId) {
        if (startDate != null) {
            if (startId != null) {
                q.addCriteria(orOp( //
                        where("created").gt(startDate), //
                        where("created").is(startDate).and("_id").gt(new ObjectId(startId))));
            } else {
                q.addCriteria(where("created").gt(startDate));
            }
        }
    }

    private void paginatedQuery(Query q, PageConfig pageConfig) {
        q.skip(pageConfig.getPageSize() * (pageConfig.getPageNumber() - 1)).limit(pageConfig.getPageSize());
    }

    private Criteria filterPublic(String userId, Set<String> shareGroups) {
        return orOp( //
                where("authorId").is(userId), //
                andOp(moderationCriteria(), scopeCriteria(shareGroups)) //
        );
    }

    private Criteria moderationCriteria() {
        return where("moderation.status").is(APPROVED.toString());
    }

    private Criteria scopeCriteria(Set<String> shareGroups) {
        Criteria publicCriteria = where("scope.visibility").is(PUBLIC.toString());

        if (shareGroups.isEmpty()) {
            return publicCriteria;
        } else {
            return orOp( //
                    publicCriteria, //
                    where("scope.visibility").is(GROUP.toString()).and("scope.shareGroups").in(shareGroups) //
            );
        }
    }

    private Criteria wherePostIdPrefixIn(Set<String> postIdPrefixSet) {
        List<Criteria> ors = new ArrayList<Criteria>(postIdPrefixSet.size());
        for (String prefix : postIdPrefixSet) {
            ors.add(where("postId").regex("^" + Pattern.quote(prefix)));
        }
        return orOp(ors.toArray(new Criteria[0]));
    }

    private Criteria andOp(Criteria... c) {
        return new Criteria().andOperator(c);
    }

    private Criteria orOp(Criteria... c) {
        return new Criteria().orOperator(c);
    }

    private void sortByPostIdAndCreated(Query q, Sort.Direction created) {
        q.with(new Sort(ASC, "postId")).with(new Sort(created, "created"));
    }

    private void sortByCreatedAndId(Query q, Sort.Direction created) {
        q.with(new Sort(created, "created")).with(new Sort(ASC, "_id"));
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        Index idx;

        idx = new Index()
                .on("postId", ASC) //
                .on("created", DESC);
        mongoTemplate.indexOps(Comment.class).ensureIndex(idx);

        idx = new Index()
                .on("postId", ASC) //
                .on("created", ASC);
        mongoTemplate.indexOps(Comment.class).ensureIndex(idx);

        idx = new Index() //
                .on("moderation.status", ASC);
        mongoTemplate.indexOps(Comment.class).ensureIndex(idx);

        idx = new Index() //
                .on("created", ASC) //
                .on("_id", ASC);
        mongoTemplate.indexOps(Comment.class).ensureIndex(idx);
    }

    private Query withTags(Query q, Set<String> tags) {
        if (tags != null && !tags.isEmpty()) {
            q = q.addCriteria(where("tags").all(tags));
        }
        return q;
    }
}
