package ru.nullpointer.nkbcomment.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.preauth.PreAuthenticatedAuthenticationToken;
import org.springframework.util.Assert;

/**
 *
 * @author Alexander Yastrebov
 */
public class AuthenticationProviderAdapter implements AuthenticationProvider, InitializingBean {

    private static final Logger logger = LoggerFactory.getLogger(AuthenticationProviderAdapter.class);
    //
    private SecurityProvider securityProvider;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        if (!supports(authentication.getClass())) {
            return null;
        }
        logger.debug("|||||||||||" + authentication.getName());
        logger.debug("|||||||||||" + authentication.getDetails());
        logger.debug("|||||||||||" + authentication.getAuthorities());
        logger.debug("|||||||||||" + authentication.getCredentials());
        logger.debug("|||||||||||" + authentication.getPrincipal());
        logger.debug("PreAuthenticated authentication request: " + authentication);

        if (authentication.getPrincipal() == null) {
            throw new BadCredentialsException("No principal found in request");
        }

        Object principal = securityProvider.authenticateWithTicket(authentication.getPrincipal().toString());
        if (principal == null) {
            throw new BadCredentialsException("Principal is null");
        }

        PreAuthenticatedAuthenticationToken result = new PreAuthenticatedAuthenticationToken(principal, authentication.getCredentials());
        result.setDetails(authentication.getDetails());

        return result;
    }

    @Override
    public boolean supports(Class<? extends Object> authentication) {
        return PreAuthenticatedAuthenticationToken.class.isAssignableFrom(authentication);
    }

    public void setSecurityProvider(SecurityProvider securityProvider) {
        this.securityProvider = securityProvider;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        Assert.notNull(securityProvider, "Security provider must be set");
    }
}
