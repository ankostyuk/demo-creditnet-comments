package ru.nullpointer.nkbcomment.api.rest;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.activation.DataHandler;
import javax.annotation.Resource;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;
import org.apache.commons.lang.StringUtils;
import org.apache.cxf.jaxrs.ext.multipart.Attachment;
import org.apache.cxf.jaxrs.ext.multipart.MultipartBody;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import ru.nullpointer.nkbcomment.domain.Comment;
import ru.nullpointer.nkbcomment.domain.Moderation;
import ru.nullpointer.nkbcomment.domain.Post;
import ru.nullpointer.nkbcomment.domain.PostInfo;
import ru.nullpointer.nkbcomment.service.BadArgumentException;
import ru.nullpointer.nkbcomment.service.CommentService;
import ru.nullpointer.nkbcomment.service.CommentServiceException;
import ru.nullpointer.nkbcomment.support.PaginatedQueryResult;

/**
 * @author Alexander Yastrebov
 * @author ankostyuk
 */
@Path("/comments")
public class CommentAPI {

    private final Logger logger = LoggerFactory.getLogger(CommentAPI.class);
    //
    private static final int DEFAULT_PAGE_SIZE = 10;
    // TODO другое решение на установку максимального размера
    private static final long ATTACHMENT_MAX_SIZE = 10 * 1024 * 1024;
    //
    @Resource
    private CommentService commentService;
    //
    @Context
    private UriInfo uriInfo;

    /**
     * Add comment. Required fields are <code>postId</code>,
     * <code>content</code> and <code>scope</code>
     *
     * @param comment Comment to add
     * @return Status: 201 Created<br>
     * Response: Comment with generated id and default values set <br>
     * Location header contains URL of added comment
     */
    @POST
    @Path("/")
    public Response addComment(Comment comment) {
        Comment result = commentService.addComment(comment);
        return Response.created(uriInfo.getAbsolutePathBuilder().path("{id}").build(result.getId()))//
                .entity(comment).build();
    }

    /**
     * Get comment
     *
     * @param id Comment id
     * @return Status: 200 OK<br>
     * Response: Comment data
     */
    @GET
    @Path("/{id}")
    public Response getComment(@PathParam("id") String id) {
        Comment result = commentService.getComment(id);
        return Response.ok(result).build();
    }

    /**
     * Update comment.
     *
     * @param id Comment id
     * @param comment Comment to update. Some fields may be omitted. User
     * permissions are checked before fields update
     * @return Status: 200 OK<br>
     * Response: Updated comment
     */
    @PUT
    @Path("/{id}")
    public Response updateComment(@PathParam("id") String id, Comment comment) {
        comment.setId(id);
        Comment result = commentService.updateComment(comment);
        return Response.ok(result).build();
    }

    /**
     * Delete comment.
     *
     * @param id Comment id
     * @return Status: 204 No Content<br>
     */
    @DELETE
    @Path("/{id}")
    public Response deleteComment(@PathParam("id") String id) {
        commentService.deleteComment(id);
        return Response.noContent().build();
    }

    @POST
    @Path("/{id}/attachment")
    @Consumes(MediaType.MULTIPART_FORM_DATA)
    /*
     * Для корректной обработки ответа веб-браузером необходим JSON,
     * но вызов API c ключом '.json' приводит к некорректной обработке ответа в Internet Explorer,
     * поэтому принудительно устанавливаем формат ответа в JSON.
     *
     * TODO Перенести данную функциональность в FileUploadSupportHandler?
     *
     */
    @Produces(MediaType.APPLICATION_JSON)
    @FileUpload
    public Response addAttachment(@PathParam("id") String id, MultipartBody body) {

        Attachment fileAtt = body.getAttachment("file");
        if (fileAtt == null) {
            throw new BadArgumentException("'file' required");
        }

        String fileName = fileAtt.getContentDisposition().getParameter("filename");
        String name = getParameter("name", body);
        if (name == null) {
            name = (fileName != null ? fileName : "unknown");
        }
        DataHandler dataHandler = fileAtt.getDataHandler();

        long size = getContentSize(dataHandler);
        if (getContentSize(dataHandler) > ATTACHMENT_MAX_SIZE) {
            // TODO Exception HTTP status 413. Известить пользователя о максимальном размере.
            throw new BadArgumentException("attachment content too large");
        }

        ru.nullpointer.nkbcomment.domain.Attachment attachment = new ru.nullpointer.nkbcomment.domain.Attachment();
        attachment.setName(name);
        attachment.setSize(size);
        attachment.setContentType(dataHandler.getContentType());
        attachment.setDataHandler(dataHandler);

        ru.nullpointer.nkbcomment.domain.Attachment result = commentService.addAttachment(id, attachment);

        return Response.ok(result).build();
    }

    @GET
    @Path("/{commentId}/attachment/{attachmentId}/{dummy}")
    /*
     * Для корректной обработки ответа веб-браузером необходим JSON,
     * но вызов API c ключом '.json' приводит к некорректной обработке ответа
     * и к некорректному присвоениию имени файла при скачивании в Internet Explorer,
     * поэтому принудительно устанавливаем формат ответа в JSON.
     *
     * TODO Перенести данную функциональность в FileDownloadSupportHandler?
     *
     */
    @Produces(MediaType.APPLICATION_JSON)
    @FileDownload
    public Response getAttachmentContent(@PathParam("commentId") String commentId, @PathParam("attachmentId") String attachmentId) throws IOException {
        ru.nullpointer.nkbcomment.domain.Attachment result = commentService.getAttachmentWithContent(commentId, attachmentId);

        return Response.ok(result.getDataHandler().getInputStream(), result.getContentType())//
                .header("Content-Disposition", "attachment")//
                .build();
    }

    @DELETE
    @Path("/{commentId}/attachment/{attachmentId}")
    public Response deleteAttachment(@PathParam("commentId") String commentId, @PathParam("attachmentId") String attachmentId) {
        commentService.deleteAttachment(commentId, attachmentId);
        return Response.noContent().build();
    }

    /**
     * Get comments for one or more posts.
     *
     * @param postIdSet One or more post id
     * @param tags One or more tags
     * @return Status: 200 OK or 204 No Content<br>
     * Response: List of posts. Comments in post are ordered by creation date.
     * Some comments may be excluded based on user permissions
     */
    @GET
    @Path("/by-post")
    public Response getCommentsByPost(@QueryParam("postId") Set<String> postIdSet,
            @QueryParam("tag") Set<String> tags) {
        List<Post> result = commentService.getCommentsByPost(postIdSet, tags);
        return buildPostListResponse(result);
    }

    /**
     * Get post info for one or more posts.
     *
     * @param postIdSet One or more post id
     * @return Status: 200 OK or 204 No Content<br>
     * Response: List of post info
     */
    @GET
    @Path("/by-post/info")
    public Response getPostInfo(@QueryParam("postId") Set<String> postIdSet) {
        List<PostInfo> result = commentService.getPostInfo(postIdSet);
        return buildPostInfoListResponse(result);
    }

    /**
     * Get paginated comment list for one post.
     *
     * @param postId post id
     * @param tags One or more tags
     * @param pageNumber page number
     * @param pageSize page size
     * @return Status: 200 OK or 204 No Content<br>
     * Response: comment list for post. Sorting: by creation date in reverse
     * chronological order. Some comments may be excluded based on user
     * permissions
     */
    @GET
    @Path("/paginated-by-post")
    public Response getPaginatedCommentListByPost(
            @QueryParam("postId") String postId,
            @QueryParam("tag") Set<String> tags,
            @QueryParam("pageNumber") Integer pageNumber,
            @QueryParam("pageSize") Integer pageSize) {
        PaginatedQueryResult<Comment> result = commentService.getPaginatedCommentListByPost(postId, tags, pageNumber, pageSize);
        return buildPaginatedCommentListResponse(result);
    }

    /**
     * Get comments for one or more posts by post id prefix.
     *
     * @param postIdPrefixSet One or more post id prefix
     * @param tags One or more tags
     * @return Status: 200 OK or 204 No Content<br>
     * Response: List of posts. Comments in post are ordered by creation date.
     * Some comments may be excluded based on user permissions
     */
    @GET
    @Path("/by-prefix")
    public Response getCommentsByPostPrefix(@QueryParam("postIdPrefix") Set<String> postIdPrefixSet,
            @QueryParam("tag") Set<String> tags) {
        List<Post> result = commentService.getCommentsByPostPrefix(postIdPrefixSet, tags);
        return buildPostListResponse(result);
    }

    /**
     * Get comments by moderation status. Comments are ordered by creation date
     * and comment id (for the same date)
     *
     * @param status Optional moderation status. If provided return comments
     * with specified status
     * @param startDate Optional comment creation date in ISO 8601 format. If
     * provided return comments created on or after this date
     * @param startId Optional comment id. Used with <code>startDate</code>. If
     * provided return comments created after <code>startDate</code> or * on
     * <code>startDate</code> but after <code>startId</code>
     * @param tags One or more tags
     * @return Status: 200 OK or 204 No Content<br>
     * Response: List of comments
     */
    @GET
    @Path("/by-status")
    public Response getCommentsByStatus(
            @QueryParam("status") Moderation.Status status,
            @QueryParam("startDate") Date startDate,
            @QueryParam("startId") String startId,
            @QueryParam("tag") Set<String> tags) {
        List<Comment> result = commentService.getCommentsByStatus(status, startDate, startId, DEFAULT_PAGE_SIZE, tags);
        return buildCommentListResponse(result);
    }

    /**
     * Get paginated comment list for user groups.
     *
     * @param pageNumber page number
     * @param pageSize page size
     * @param tags One or more tags
     * @return Status: 200 OK or 204 No Content<br>
     * Response: comment list for user groups. Sorting: by creation date in
     * reverse chronological order.
     */
    @GET
    @Path("/by-groups")
    public Response getCommentsByUserGroups(
            @QueryParam("pageNumber") Integer pageNumber,
            @QueryParam("pageSize") Integer pageSize,
            @QueryParam("tag") Set<String> tags) {
        PaginatedQueryResult<Comment> result = commentService.getPaginatedCommentListByUserGroups(pageNumber, pageSize, tags);
        return buildPaginatedCommentListResponse(result);
    }

    /**
     * Get comments by author. Comments are ordered by creation date and comment
     * id (for the same date)
     *
     * @param startDate Optional comment creation date in ISO 8601 format. If
     * provided return comments created on or after this date
     * @param startId Optional comment id. Used with <code>startDate</code>. If
     * provided return comments created after <code>startDate</code> or * on
     * <code>startDate</code> but after <code>startId</code>
     * @param tags One or more tags
     * @return Status: 200 OK or 204 No Content<br>
     * Response: List of comments
     */
    @GET
    @Path("/by-author")
    public Response getCommentsByAuthor(
            @QueryParam("startDate") Date startDate,
            @QueryParam("startId") String startId,
            @QueryParam("tag") Set<String> tags) {
        List<Comment> result = commentService.getCommentsByAuthor(startDate, startId, DEFAULT_PAGE_SIZE, tags);
        return buildCommentListResponse(result);
    }

    private String getParameter(String name, MultipartBody body) {
        Attachment att = body.getAttachment(name);
        if (att != null) {
            return StringUtils.trimToNull(att.getObject(String.class));
        }
        return null;
    }

    private Response buildPaginatedCommentListResponse(PaginatedQueryResult<Comment> paginatedQueryResult) {
        if (!paginatedQueryResult.getList().isEmpty()) {
            PaginatedResult<Comment> result = buildPaginatedResult(paginatedQueryResult);
            return Response.ok(result).build();
        }
        return Response.noContent().build();
    }

    private Response buildCommentListResponse(List<Comment> commentList) {
        if (!commentList.isEmpty()) {
            GenericEntity<List<Comment>> entity = new GenericEntity<List<Comment>>(commentList) {
            };
            return Response.ok(entity).build();
        }
        return Response.noContent().build();
    }

    private Response buildPostListResponse(List<Post> postList) {
        if (!postList.isEmpty()) {
            GenericEntity<List<Post>> entity = new GenericEntity<List<Post>>(postList) {
            };
            return Response.ok(entity).build();
        }
        return Response.noContent().build();
    }

    private Response buildPostInfoListResponse(List<PostInfo> postList) {
        if (!postList.isEmpty()) {
            GenericEntity<List<PostInfo>> entity = new GenericEntity<List<PostInfo>>(postList) {
            };
            return Response.ok(entity).build();
        }
        return Response.noContent().build();
    }

    private <T> PaginatedResult<T> buildPaginatedResult(PaginatedQueryResult<T> paginatedQueryResult) {
        PaginatedResult<T> result = new PaginatedResult<T>();

        result.setEntries(paginatedQueryResult.getList());
        result.setTotal(paginatedQueryResult.getTotal());
        result.setPageNumber(paginatedQueryResult.getPageNumber());
        result.setPageSize(paginatedQueryResult.getPageSize());
        result.setPageCount(paginatedQueryResult.getPageCount());
        result.setFirstNumber(paginatedQueryResult.getFirstNumber());
        result.setLastNumber(paginatedQueryResult.getLastNumber());

        return result;
    }

    // Временное и неправильное решение
    // TODO другое решение
    private long getContentSize(DataHandler dataHandler) {
        try {
            return dataHandler.getInputStream().available();
        } catch (IOException ex) {
            throw new CommentServiceException("Error reading file content");
        }
    }
}
