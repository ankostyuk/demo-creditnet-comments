package ru.nullpointer.nkbcomment.utils;

import java.util.HashMap;
import java.util.Map;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

/**
 *
 * @author Alexander Yastrebov
 */
public class AtLeastOneChecker {

    private Map<String, Boolean> conditions;

    public AtLeastOneChecker() {
        conditions = new HashMap<String, Boolean>();
    }

    public AtLeastOneChecker expect(String key) {
        conditions.put(key, Boolean.FALSE);
        return this;
    }

    public void meet(String key) {
        if (!conditions.containsKey(key)) {
            fail("Unexpected key: " + key);
        }
        conditions.put(key, Boolean.TRUE);
    }

    public void check() {
        for (String key : conditions.keySet()) {
            assertTrue("Key '" + key + "' was not checked or all values were false", conditions.get(key));
        }
    }
}
