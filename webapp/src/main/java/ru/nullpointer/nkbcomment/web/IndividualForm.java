package ru.nullpointer.nkbcomment.web;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 *
 * @author Maksim Konyuhov
 */
public class IndividualForm {

    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
