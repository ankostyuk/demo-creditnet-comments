package ru.nullpointer.nkbcomment.api.rest;

import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import ru.nullpointer.nkbcomment.service.BadArgumentException;

/**
 *
 * @author Alexander Yastrebov
 */
public class BadArgumentExceptionMapper implements ExceptionMapper<BadArgumentException> {

    @Override
    public Response toResponse(BadArgumentException e) {
        return Response//
                .status(Response.Status.BAD_REQUEST)//
                .entity(new ErrorResult(e.getMessage()))//
                .build();
    }
}
