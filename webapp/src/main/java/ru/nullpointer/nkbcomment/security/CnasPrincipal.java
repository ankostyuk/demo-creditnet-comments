package ru.nullpointer.nkbcomment.security;

import creditnet.cnas.auth.PermissionSet;
import org.apache.commons.lang.builder.ToStringBuilder;

/**
 *
 * @author Alexander Yastrebov
 */
public class CnasPrincipal {

    private String userId;
    private PermissionSet permissionSet;

    public CnasPrincipal(String userId, PermissionSet permissionSet) {
        this.userId = userId;
        this.permissionSet = permissionSet;
    }

    public String getUserId() {
        return userId;
    }

    public PermissionSet getPermissionSet() {
        return permissionSet;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
