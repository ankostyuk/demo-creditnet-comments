package ru.nullpointer.nkbcomment.security;

import javax.servlet.http.HttpServletRequest;
import org.springframework.security.web.authentication.preauth.AbstractPreAuthenticatedProcessingFilter;
import org.springframework.util.Assert;

/**
 *
 * @author Alexander Yastrebov
 */
public class RequestParamAuthenticationFilter extends AbstractPreAuthenticatedProcessingFilter {

    private String principalRequestParam;

    @Override
    protected Object getPreAuthenticatedPrincipal(HttpServletRequest request) {
        String principal = request.getParameter(principalRequestParam);
        return principal;
    }

    @Override
    protected Object getPreAuthenticatedCredentials(HttpServletRequest hsr) {
        return "N/A";
    }

    public void setPrincipalRequestParam(String principalRequestParam) {
        this.principalRequestParam = principalRequestParam;
    }

    @Override
    public void afterPropertiesSet() {
        super.afterPropertiesSet();
        Assert.hasText(principalRequestParam, "'principalRequestParam' must be set");
    }
}
