package ru.nullpointer.nkbcomment.domain;

import java.util.Set;
import org.apache.commons.lang.builder.ToStringBuilder;

/**
 *
 * @author Alexander Yastrebov
 */
public class Scope {

    public static enum Visibility {

        PRIVATE,
        GROUP,
        PUBLIC
    }
    private Visibility visibility;
    private Set<String> shareGroups;

    public Visibility getVisibility() {
        return visibility;
    }

    public void setVisibility(Visibility visibility) {
        this.visibility = visibility;
    }

    public Set<String> getShareGroups() {
        return shareGroups;
    }

    public void setShareGroups(Set<String> shareGroups) {
        this.shareGroups = shareGroups;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
