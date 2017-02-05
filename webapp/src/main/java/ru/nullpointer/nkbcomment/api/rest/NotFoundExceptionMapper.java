package ru.nullpointer.nkbcomment.api.rest;

import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import ru.nullpointer.nkbcomment.service.NotFoundException;

/**
 *
 * @author Alexander Yastrebov
 */
public class NotFoundExceptionMapper implements ExceptionMapper<NotFoundException> {

    @Override
    public Response toResponse(NotFoundException e) {
        return Response//
                .status(Response.Status.NOT_FOUND)//
                .entity(new ErrorResult(e.getMessage()))//
                .build();
    }
}
