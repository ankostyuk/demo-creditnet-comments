package ru.nullpointer.nkbcomment.service;

import java.util.EnumSet;
import java.util.List;
import java.util.Set;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import ru.nullpointer.nkbcomment.domain.Group;
import ru.nullpointer.nkbcomment.domain.UserInfo;
import ru.nullpointer.nkbcomment.security.domain.Permission;

/**
 * @author Alexander Yastrebov
 * @author ankostyuk
 */
@Service("nkbUserService")
public class UserService {

    @Resource
    private SecurityService securityService;

    public UserInfo getUserInfo() {
        String userId = securityService.getAuthenticatedUserId();

        UserInfo ui = new UserInfo();
        ui.setUserId(userId);
        ui.setPermissions(getPermissions(userId));
        ui.setShareGroups(securityService.getShareGroups(userId));

        return ui;
    }

    public List<Group> getShareGroupList(String userId) {
        if (!securityService.getAuthenticatedUserId().equals(userId)) {
            securityService.ensureHasPermission(Permission.EDIT_SCOPE);
        }

        return securityService.getShareGroups(userId);
    }

    private Set<Permission> getPermissions(String userId) {
        EnumSet<Permission> result = EnumSet.noneOf(Permission.class);
        for (Permission p : Permission.values()) {
            if (securityService.hasPermission(userId, p)) {
                result.add(p);
            }
        }
        return result;
    }
}
