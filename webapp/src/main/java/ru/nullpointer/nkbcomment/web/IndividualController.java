package ru.nullpointer.nkbcomment.web;

import java.util.Collections;
import java.util.List;
import java.util.Set;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.nullpointer.nkbcomment.domain.PostInfo;
import ru.nullpointer.nkbcomment.security.domain.Permission;
import ru.nullpointer.nkbcomment.service.CommentService;
import ru.nullpointer.nkbcomment.service.SecurityService;

/**
 *
 * @author Maksim Konyuhov
 */
@Controller
public class IndividualController {

    private static final Logger logger = LoggerFactory.getLogger(IndividualController.class);
    //
    @Resource
    private SecurityService securityService;
    //
    @Resource
    private CommentService commentService;

    @ModelAttribute("individual")
    public IndividualForm initIndividual() {
        return new IndividualForm();
    }

    @RequestMapping(value = "/individual", method = RequestMethod.GET)
    public void handleGet(@ModelAttribute("individual") IndividualForm individual, ModelMap model) {
        securityService.ensureHasPermission(Permission.VIEW);

        logger.debug("GET individual: {}", individual);

        String postId = PostIdUtils.createIndividualPostId(individual.getName());
        if (postId == null) {
            return;
        }

        Set<String> postIdSet = Collections.singleton(postId);
        List<PostInfo> postInfos = commentService.getPostInfo(postIdSet);
        if (!postInfos.isEmpty()) {
            int commentCount = postInfos.get(0).getCommentCount();
            model.addAttribute("commentCount", commentCount);
        }
        model.addAttribute("postId", postId);
    }
}
