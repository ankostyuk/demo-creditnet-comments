package ru.nullpointer.nkbcomment.web;

import org.junit.Test;
import static org.junit.Assert.*;
import static ru.nullpointer.nkbcomment.web.PostIdUtils.*;

/**
 *
 * @author Maksim Konyuhov
 */
public class PostIdUtilsTest {

    @Test
    public void testExtractValidBsnId() {
        assertEquals("12345", extractBsnId("/bsnId:12345"));
        assertEquals("12345", extractBsnId("/bsnId:12345/"));
        assertEquals("12345", extractBsnId("/bsnId:12345/blocks/cnblk04"));
    }

    @Test
    public void testExtractInvalidBsnId() {
        assertNull(extractBsnId("/bsnId:"));
        assertNull(extractBsnId("/bsnId:/"));
        assertNull(extractBsnId("/bsnId:/blocks/cnblk04"));
        assertNull(extractBsnId("baddata"));
    }

    @Test
    public void testCreateIndividualPostId() {
        assertEquals("/individual/ИВАНОВ ПЕТР СЕРГЕЕВИЧ", createIndividualPostId(" Иванов   Петр  Сергеевич  "));
    }
}
