package ru.nullpointer.nkbcomment.security;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.springframework.security.web.authentication.preauth.AbstractPreAuthenticatedProcessingFilter;
import org.springframework.util.Assert;

/**
 *
 * @author Alexander Yastrebov
 */
public class RequestCookieAuthenticationFilter extends AbstractPreAuthenticatedProcessingFilter {

    private String principalRequestCookie;

    @Override
    protected Object getPreAuthenticatedPrincipal(HttpServletRequest request) {
        Cookie[] cc = request.getCookies();
        if (cc != null) {
            for (Cookie c : cc) {
                if (principalRequestCookie.equals(c.getName())) {
                    return c.getValue();
                }
            }
        }
        return null;
    }

    @Override
    protected Object getPreAuthenticatedCredentials(HttpServletRequest hsr) {
        return "N/A";
    }

    public void setPrincipalRequestCookie(String principalRequestCookie) {
        this.principalRequestCookie = principalRequestCookie;
    }

    @Override
    public void afterPropertiesSet() {
        super.afterPropertiesSet();
        Assert.hasText(principalRequestCookie, "'principalRequestCookie' must be set");
    }
}
