package ru.nullpointer.nkbcomment.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpRequestResponseHolder;
import org.springframework.security.web.context.SecurityContextRepository;

/**
 *
 * @author Alexander Yastrebov
 */
public class NullSecurityContextRepository implements SecurityContextRepository {

    @Override
    public SecurityContext loadContext(HttpRequestResponseHolder hrrh) {
        return SecurityContextHolder.createEmptyContext();
    }

    @Override
    public void saveContext(SecurityContext sc, HttpServletRequest hsr, HttpServletResponse hsr1) {
    }

    @Override
    public boolean containsContext(HttpServletRequest hsr) {
        return false;
    }
}
