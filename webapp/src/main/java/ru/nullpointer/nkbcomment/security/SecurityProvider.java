package ru.nullpointer.nkbcomment.security;

import ru.nullpointer.nkbcomment.domain.Group;

import java.util.List;
import java.util.Map;
import java.util.Set;
import ru.nullpointer.nkbcomment.security.domain.Permission;

/**
 *
 * @author Alexander Yastrebov
 */
public interface SecurityProvider {

    String authenticate(String login, String password);

    Object authenticateWithTicket(String ticket);

    boolean hasPermission(String userId, Permission permission);

    String getAuthenticatedUserId();

    List<Group> getShareGroups(String userId);

    Map<String, String> getUserNameMap(Set<String> userIds);
}
