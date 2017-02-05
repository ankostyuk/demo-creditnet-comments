package ru.nullpointer.nkbcomment.service;

import java.lang.reflect.InvocationTargetException;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.util.Assert;

/**
 *
 * @author Alexander Yastrebov
 */
final class ValidationUtils {

    public static void checkRequired(Object o, String... fields) {
        Assert.notEmpty(fields);
        Assert.noNullElements(fields);
        for (String f : fields) {
            Object value = getValue(o, f);
            if (value == null) {
                throw new BadArgumentException("'" + f + "' required");
            }
        }
    }

    public static void checkNotBlank(Object o, String... fields) {
        Assert.notEmpty(fields);
        Assert.noNullElements(fields);
        for (String f : fields) {
            Object value = getValue(o, f);
            if (value == null || StringUtils.isBlank(value.toString())) {
                throw new BadArgumentException("'" + f + "' value must be set");
            }
        }
    }

    public static void trimToNull(Object o, String... fields) {
        Assert.notEmpty(fields);
        Assert.noNullElements(fields);
        for (String f : fields) {
            Object value = getValue(o, f);
            if (value instanceof String && StringUtils.isBlank(value.toString())) {
                setValue(o, f, null);
            }
        }
    }

    private static Object getValue(Object o, String f) {
        try {
            return PropertyUtils.getProperty(o, f);
        } catch (IllegalAccessException ex) {
            throw new RuntimeException(ex);
        } catch (InvocationTargetException ex) {
            throw new RuntimeException(ex);
        } catch (NoSuchMethodException ex) {
            throw new RuntimeException(ex);
        }
    }

    private static void setValue(Object o, String f, Object value) {
        try {
            PropertyUtils.setProperty(o, f, value);
        } catch (IllegalAccessException ex) {
            throw new RuntimeException(ex);
        } catch (InvocationTargetException ex) {
            throw new RuntimeException(ex);
        } catch (NoSuchMethodException ex) {
            throw new RuntimeException(ex);
        }
    }
}
