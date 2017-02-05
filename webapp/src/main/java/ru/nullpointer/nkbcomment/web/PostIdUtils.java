package ru.nullpointer.nkbcomment.web;

import org.apache.commons.lang.StringUtils;
import org.springframework.util.Assert;

/**
 *
 * @author Maksim Konyuhov
 */
class PostIdUtils {

    private static final String BSN_ID_PREFIX = "/bsnId:";

    private PostIdUtils() {
    }

    public static String extractBsnId(String postId) {
        Assert.hasText(postId);

        if (!postId.startsWith(BSN_ID_PREFIX)) {
            return null;
        }
        int end = postId.indexOf('/', BSN_ID_PREFIX.length());
        if (end == -1) {
            end = postId.length();
        }
        String bsnId = postId.substring(BSN_ID_PREFIX.length(), end);
        return !bsnId.isEmpty() ? bsnId : null;
    }

    public static String createIndividualPostId(String name) {
        if (StringUtils.isBlank(name)) {
            return null;
        }
        name = StringUtils.normalizeSpace(name);
        name = name.replace("ё", "е");
        name = name.replace("Ё", "Е");
        name = name.toUpperCase();

        return "/individual/" + name;
    }
}
