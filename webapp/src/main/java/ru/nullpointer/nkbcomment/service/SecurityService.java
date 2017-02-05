package ru.nullpointer.nkbcomment.service;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import ru.nullpointer.nkbcomment.domain.Group;
import ru.nullpointer.nkbcomment.security.domain.Permission;
import ru.nullpointer.nkbcomment.security.SecurityProvider;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author Alexander Yastrebov
 */
@Service
public class SecurityService {

    @Resource
    private SecurityProvider provider;

    public boolean hasPermission(String userId, Permission permission) {
        return provider.hasPermission(userId, permission);
    }

    public String getAuthenticatedUserId() {
        return provider.getAuthenticatedUserId();
    }

    public List<Group> getShareGroups(String userId) {
        return provider.getShareGroups(userId);
    }

    public Set<String> getShareGroupIds(String userId) {
        List<Group> groupList = provider.getShareGroups(userId);
        Set<String> result = new HashSet<String>(groupList.size());
        for (Group g : groupList) {
            result.add(g.getId());
        }
        return result;
    }

    public Map<String, String> getUserNameMap(Set<String> userIds) {
        return provider.getUserNameMap(userIds);
    }

    public void ensureHasPermission(Permission permission) {
        Assert.notNull(permission);
        if (!provider.hasPermission(getAuthenticatedUserId(), permission)) {
            accessDenied("Not enough permissions");
        }
    }

    public void accessDenied() {
        accessDenied("Access denied");
    }

    public void accessDenied(String message) {
        throw new AccessDeniedException(message);
    }
}
