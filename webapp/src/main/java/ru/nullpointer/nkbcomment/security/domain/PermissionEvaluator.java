package ru.nullpointer.nkbcomment.security.domain;

/**
 *
 * @author Alexander Yastrebov
 */
public interface PermissionEvaluator<T> {

    boolean hasPermission(T obj);
}
