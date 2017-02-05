package ru.nullpointer.nkbcomment.web;

import java.io.IOException;
import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.nullpointer.nkbcomment.security.SecurityProvider;

/**
 *
 * @author Alexander Yastrebov
 */
@Controller
public class DemoLoginController {

    private Logger logger = LoggerFactory.getLogger(DemoLoginController.class);
    //
    @Resource
    private SecurityProvider securityProvider;
    //
    private static final String[] TICKET_COOKIE_NAMES = new String[]{
        "creditnet_ticket", "creditnet_backend_ticket", //"creditnet_comments_ticket"
    };

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setAllowedFields("login", "password");
        binder.setRequiredFields("login", "password");
    }

    @RequestMapping(value = "/demo/login", method = RequestMethod.GET)
    public void handleGet(HttpServletRequest request, ModelMap model) {
        Cookie[] cc = request.getCookies();
        if (cc != null) {
            cookie_found:
            for (Cookie c : cc) {
                for (String name : TICKET_COOKIE_NAMES) {
                    if (name.equals(c.getName())) {
                        model.addAttribute("ticket", c.getValue());
                        break cookie_found;
                    }
                }
            }
        }
    }

    @RequestMapping(value = "/demo/login", method = RequestMethod.POST)
    public String handlePost(@ModelAttribute("model") @Valid Login login, BindingResult result, HttpServletResponse response) {
        logger.debug("handle post: {}", login);
        if (result.hasErrors()) {
            return "demo/login";
        }

        String ticket;
        try {
            ticket = securityProvider.authenticate(login.getLogin(), login.getPassword());
        } catch (Exception ex) {
            logger.debug("{}", ex.getMessage());

            result.reject("auth.error", ex.getMessage());
            return "demo/login";
        }

        logger.debug("token: {}", ticket);

        for (String name : TICKET_COOKIE_NAMES) {
            Cookie c = new Cookie(name, ticket);
            c.setPath("/");
            response.addCookie(c);
        }
        return "redirect:/demo/login";
    }

    @RequestMapping(value = "/demo/logout", method = RequestMethod.GET)
    public String handleLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        for (String name : TICKET_COOKIE_NAMES) {
            Cookie c = new Cookie(name, "");
            c.setMaxAge(0);
            c.setPath("/");
            response.addCookie(c);
        }
        return "redirect:/demo/login";
    }

    public static class Login {

        private String login;
        private String password;

        public String getLogin() {
            return login;
        }

        public void setLogin(String login) {
            this.login = login;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        @Override
        public String toString() {
            return ToStringBuilder.reflectionToString(this);
        }
    }
}
