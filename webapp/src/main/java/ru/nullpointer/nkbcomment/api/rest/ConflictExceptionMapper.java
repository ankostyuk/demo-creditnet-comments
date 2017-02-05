package ru.nullpointer.nkbcomment.api.rest;

import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import ru.nullpointer.nkbcomment.service.ConflictException;

/**
 *
 * @author Alexander Yastrebov
 */
public class ConflictExceptionMapper implements ExceptionMapper<ConflictException> {

    @Override
    public Response toResponse(ConflictException e) {
        return Response//
                .status(Response.Status.CONFLICT)//
                .entity(new ErrorResult(e.getMessage()))//
                .build();
    }
}
