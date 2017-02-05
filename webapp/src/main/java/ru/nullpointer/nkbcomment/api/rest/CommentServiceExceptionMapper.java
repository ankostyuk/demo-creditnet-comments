package ru.nullpointer.nkbcomment.api.rest;

import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import ru.nullpointer.nkbcomment.service.CommentServiceException;

/**
 *
 * @author Alexander Yastrebov
 */
public class CommentServiceExceptionMapper implements ExceptionMapper<CommentServiceException> {

    @Override
    public Response toResponse(CommentServiceException e) {
        return Response//
                .status(Response.Status.INTERNAL_SERVER_ERROR)//
                .entity(new ErrorResult(e.getMessage()))//
                .build();
    }
}
