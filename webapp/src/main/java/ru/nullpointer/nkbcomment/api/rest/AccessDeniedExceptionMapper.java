package ru.nullpointer.nkbcomment.api.rest;

import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import org.springframework.security.access.AccessDeniedException;

/**
 *
 * @author Alexander Yastrebov
 */
public class AccessDeniedExceptionMapper implements ExceptionMapper<AccessDeniedException> {

    @Override
    public Response toResponse(AccessDeniedException e) {
        return Response//
                .status(Response.Status.FORBIDDEN)//
                .entity(new ErrorResult(e.getMessage()))//
                .build();
    }
}
