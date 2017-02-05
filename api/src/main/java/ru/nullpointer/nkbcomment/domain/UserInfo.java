package ru.nullpointer.nkbcomment.domain;

import java.util.List;
import java.util.Set;
import javax.xml.bind.annotation.XmlRootElement;
import org.apache.commons.lang.builder.ToStringBuilder;
import ru.nullpointer.nkbcomment.security.domain.Permission;

/**
 * @author Alexander Yastrebov
 * @author ankostyuk
 */
@XmlRootElement
public class UserInfo {

    private String userId;
    private Set<Permission> permissions;
    private List<Group> shareGroups;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Set<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(Set<Permission> permissions) {
        this.permissions = permissions;
    }

    public List<Group> getShareGroups() {
        return shareGroups;
    }

    public void setShareGroups(List<Group> shareGroups) {
        this.shareGroups = shareGroups;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
