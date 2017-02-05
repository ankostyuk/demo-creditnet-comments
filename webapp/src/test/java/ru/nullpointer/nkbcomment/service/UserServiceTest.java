package ru.nullpointer.nkbcomment.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.annotation.Resource;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import static org.mockito.Mockito.when;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ru.nullpointer.nkbcomment.domain.UserInfo;
import ru.nullpointer.nkbcomment.security.domain.Permission;
import ru.nullpointer.nkbcomment.security.SecurityProvider;
import static ru.nullpointer.nkbcomment.security.domain.Permission.*;

/**
 *
 * @author Alexander Yastrebov
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/spring/beans.xml", "/spring/applicationContext.xml"})
public class UserServiceTest {

    @Resource
    private UserService userService;
    //
    @Resource
    private SecurityProvider sp;

    @Before
    public void setUp() {
        Mockito.reset(sp);
    }

    @Test
    public void testNoPermissions() {
        when(sp.getAuthenticatedUserId()).thenReturn("userWithNoPermissions");

        UserInfo ui = userService.getUserInfo();
        assertTrue(ui.getPermissions().isEmpty());
    }

    @Test
    public void testGetPermissions() {
        List<Permission> list = new ArrayList<Permission>();
        list.add(VIEW);
        list.add(CREATE);
        list.add(EDIT);

        when(sp.getAuthenticatedUserId()).thenReturn("user1");
        for (Permission p : list) {
            when(sp.hasPermission("user1", p)).thenReturn(true);
        }

        UserInfo ui = userService.getUserInfo();

        Set<Permission> permissions = ui.getPermissions();
        assertFalse(permissions.isEmpty());
        assertTrue(permissions.containsAll(list));
        assertTrue(permissions.size() == list.size());
    }
}
