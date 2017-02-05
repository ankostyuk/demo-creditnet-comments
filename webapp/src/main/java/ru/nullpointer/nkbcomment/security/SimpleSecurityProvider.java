package ru.nullpointer.nkbcomment.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.util.Assert;
import ru.nullpointer.nkbcomment.domain.Group;

import javax.annotation.Resource;
import java.util.*;
import ru.nullpointer.nkbcomment.security.domain.Permission;

/**
 *
 * @author Alexander Yastrebov
 */
public class SimpleSecurityProvider implements SecurityProvider {

    private static final String TICKET_PREFIX = "ticket_";
    //
    private Logger logger = LoggerFactory.getLogger(SimpleSecurityProvider.class);
    //
    @Resource
    private UserDetailsService userService;

    @Override
    public String authenticate(String login, String password) {
        UserDetails ud = userService.loadUserByUsername(login);
        return TICKET_PREFIX + ud.getUsername();
    }

    @Override
    public Object authenticateWithTicket(String ticket) {
        Assert.hasText(ticket);

        if (ticket.startsWith(TICKET_PREFIX) && ticket.length() > TICKET_PREFIX.length()) {
            return ticket.substring(TICKET_PREFIX.length());
        }

        throw new BadCredentialsException("Invalid ticket");
    }

    @Override
    public boolean hasPermission(String userId, Permission permission) {
        Assert.hasText(userId);
        Assert.notNull(permission);

        Collection<? extends GrantedAuthority> auths = userService.loadUserByUsername(userId).getAuthorities();
        for (GrantedAuthority a : auths) {
            if (permission.toString().toLowerCase().equals(a.getAuthority())) {
                return true;
            }
        }
        return false;
    }

    @Override
    public String getAuthenticatedUserId() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null) {
            throw new AuthenticationCredentialsNotFoundException("Not authenticated");
        }
        return auth.getName();
    }

    @Override
    public List<Group> getShareGroups(String userId) {
        Assert.notNull(userId);
        final String GROUP_PREFIX = "group(";

        Collection<? extends GrantedAuthority> auths = userService.loadUserByUsername(userId).getAuthorities();
        List<Group> result = new ArrayList<Group>();
        for (GrantedAuthority a : auths) {
            String s = a.getAuthority();
            if (s.startsWith(GROUP_PREFIX)) {
                int delim = s.indexOf(':', GROUP_PREFIX.length());
                int last = s.lastIndexOf(')');
                if (delim > 0 && last > delim + 1) {
                    Group g = new Group();
                    g.setId(s.substring(GROUP_PREFIX.length(), delim));
                    g.setName(s.substring(delim + 1, last));
                    result.add(g);

                    logger.debug("Group: {}", g);
                }
            }
        }
        return result;
    }

    @Override
    public Map<String, String> getUserNameMap(Set<String> userIds) {
        Assert.notNull(userIds);
        Map<String, String> result = new HashMap<String, String>(userIds.size());
        for (String id : userIds) {
            result.put(id, "Пользователь#" + id);
        }
        return result;
    }
}
