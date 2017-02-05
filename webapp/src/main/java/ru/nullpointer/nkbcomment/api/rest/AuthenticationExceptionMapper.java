package ru.nullpointer.nkbcomment.api.rest;

import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import org.springframework.security.core.AuthenticationException;

/**
 *
 * @author Alexander Yastrebov
 */
public class AuthenticationExceptionMapper implements ExceptionMapper<AuthenticationException> {

    @Override
    public Response toResponse(AuthenticationException e) {
        return Response//
                .status(Response.Status.UNAUTHORIZED)//
                .entity(new ErrorResult(e.getMessage()))//
                .build();
    }
}
