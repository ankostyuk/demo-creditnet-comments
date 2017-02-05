package ru.nullpointer.nkbcomment.security;

//import creditnet.cnas.auth.*;
import creditnet.cnas.auth.Client;
import creditnet.cnas.auth.PermissionSet;
import creditnet.cnas.auth.SecurityServiceEndpoint;
import creditnet.cnas.auth.SsoTicket;
import creditnet.cnas.auth.User;
import creditnet.cnas.auth.exception.AuthException;
import creditnet.cnas.common.NcbUUID;
import creditnet.cnas.service.UserGroup;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.Assert;
import ru.nullpointer.nkbcomment.domain.Group;

import java.util.*;
import ru.nullpointer.nkbcomment.security.domain.Permission;

/**
 *
 * @author Alexander Yastrebov
 */
public class CnasSecurityProvider implements SecurityProvider, InitializingBean {

    private Logger logger = LoggerFactory.getLogger(CnasSecurityProvider.class);
    //
    private SecurityServiceEndpoint securityServiceEndpoint;

    private final String NKB_USERS_ALIAS = "НКБ";
    private final Integer NKB_USER_TYPE_ID = 12;

    @Override
    public String authenticate(String login, String password) {
        Assert.hasText(login);
        Assert.hasText(password);

        try {
            SsoTicket ticket = securityServiceEndpoint.authenticate(login, password, "127.0.0.1", 3600);
            return ticket.getId().toString();
        } catch (Exception ex) {
            throw new BadCredentialsException("Authentication failed", ex);
        }
    }

    @Override
    public Object authenticateWithTicket(String ticket) {
        Assert.hasText(ticket);

        NcbUUID uuid = parseUUID(ticket);
        if (uuid == null) {
            throw new BadCredentialsException("Invalid ticket");
        }

        SsoTicket ssoTicket;
        try {
            ssoTicket = securityServiceEndpoint.authenticateWithTicket(uuid);
        } catch (Exception ex) {
            throw new AuthenticationServiceException("Authentication failed", ex);
        }

        NcbUUID uid = ssoTicket.getUserUUID();
        PermissionSet ps = securityServiceEndpoint.getDomainPermissionsForUserId("creditnet.comments.*", uid);

        return new CnasPrincipal(uid.toString(), ps);
    }

    @Override
    public boolean hasPermission(String userId, Permission permission) {
        Assert.hasText(userId);
        Assert.notNull(permission);

        PermissionSet permissionSet;

        CnasPrincipal principal = getAuthenticatedPrincipal();
        if (principal.getUserId().equals(userId)) {
            permissionSet = principal.getPermissionSet();
        } else {
            NcbUUID uid = parseUUID(userId);
            if (uid == null) {
                return false;
            }
            permissionSet = securityServiceEndpoint.getDomainPermissionsForUserId("creditnet.comments.*", uid);
        }

        String p = "creditnet.comments." + permission.toString().toLowerCase();
        return permissionSet.isAllowed(p);
    }

    @Override
    public String getAuthenticatedUserId() {
        return getAuthenticatedPrincipal().getUserId();
    }

    @Override
    public List<Group> getShareGroups(String userId) {
        Assert.hasText(userId);

        NcbUUID uid = parseUUID(userId);
        if (uid == null) {
            return Collections.emptyList();
        }

        List<UserGroup> list = securityServiceEndpoint.getUserGroupsByPermission(uid, "creditnet.comments.group.share");
        if (list == null || list.isEmpty()) {
            return Collections.emptyList();
        }

        List<Group> result = new ArrayList<Group>(list.size());
        for (UserGroup ug : list) {
            Group g = new Group();
            g.setId(ug.getUuid().toString());
            g.setName(ug.getGroupName());
            result.add(g);
        }
        return result;
    }

    @Override
    public Map<String, String> getUserNameMap(Set<String> userIds) {
        Assert.notNull(userIds);

        List<NcbUUID> uidList = new ArrayList<NcbUUID>(userIds.size());
        for (String id : userIds) {
            NcbUUID uid = parseUUID(id);
            if (uid != null) {
                uidList.add(uid);
            }
        }

        if (uidList.isEmpty()) {
            return Collections.emptyMap();
        }

        List<User> userList = securityServiceEndpoint.getUsers(uidList);

        if (userList == null || userList.isEmpty()) {
            return Collections.emptyMap();
        }

        Map<String, String> result = new HashMap<String, String>(uidList.size());
        for (User u : userList) {
            result.put(u.getId().toString(), u.getName());
        }

        Integer authenticatedUserClientType = getAuthenticatedUserClientType();
        if (authenticatedUserClientType != null && !authenticatedUserClientType.equals(NKB_USER_TYPE_ID)) {
            List<Client> clientList = securityServiceEndpoint.getClients(uidList);
            if (clientList != null) {
                updateUserNameMapWithNkbUserAliases(result, clientList);
            }
        }

        return result;
    }

    private void updateUserNameMapWithNkbUserAliases(Map<String, String> userNameMap, List<Client> clientList) {
        if (clientList != null) {
            for (Client client : clientList) {
                if (client.getType() == NKB_USER_TYPE_ID) {
                    userNameMap.put(client.getId().toString(), NKB_USERS_ALIAS);
                }
            }
        }
    }

    private Integer getAuthenticatedUserClientType() {
        String authUserId = getAuthenticatedPrincipal().getUserId();
        if (authUserId == null) {
            return null;
        }
        NcbUUID uid = parseUUID(authUserId);
        if (uid == null) {
            return null;
        }
        Client client = null;
        try {
            client = securityServiceEndpoint.getClient(uid);
        } catch (AuthException e) {
            e.printStackTrace();
        }
        if (client == null) {
            return null;
        }
        return client.getType();
    }

    private NcbUUID parseUUID(String s) {
        try {
            return new NcbUUID(s);
        } catch (NumberFormatException ex) {
            logger.warn("Illegal UUID format: {}", ex.getMessage());
            return null;
        }
    }

    private CnasPrincipal getAuthenticatedPrincipal() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null) {
            throw new AuthenticationCredentialsNotFoundException("Not authenticated");
        }
        return (CnasPrincipal) auth.getPrincipal();
    }

    public void setSecurityServiceEndpoint(SecurityServiceEndpoint securityServiceEndpoint) {
        this.securityServiceEndpoint = securityServiceEndpoint;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        Assert.notNull(securityServiceEndpoint, "'securityServiceEndpoint' must be set");
    }
}
