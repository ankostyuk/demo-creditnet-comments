package ru.nullpointer.nkbcomment.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.nullpointer.nkbcomment.domain.Comment;
import ru.nullpointer.nkbcomment.domain.Group;
import ru.nullpointer.nkbcomment.domain.PostInfo;
import ru.nullpointer.nkbcomment.service.CommentService;
import ru.nullpointer.nkbcomment.service.UserService;
import ru.nullpointer.nkbcomment.support.PaginatedQueryResult;

/**
 *
 * @author Maksim Konyuhov
 * @author ankostyuk
 */
@Controller
public class GroupActivityController {

    private Logger logger = LoggerFactory.getLogger(GroupActivityController.class);
    //
    private static final int DEFAULT_PAGE_SIZE = 10;

    private static final List<String> TAG_NAMES = Collections.unmodifiableList(Arrays.asList(
            "Опыт сотрудничества",
            "Репутация",
            "Платежеспособность",
            "Мошенничество",
            "Криминал"
        ));
    //
    @Resource
    private CommentService commentService;
    @Resource
    private UserService userService;

    @RequestMapping(value = "/groups", method = RequestMethod.GET)
    public void handleGet(
            @RequestParam(value = "page", required = false, defaultValue = "1") Integer pageNumber,
            @RequestParam(value = "tag", required = false) Set<String> tags,
            ModelMap model) {

        PaginatedQueryResult<Comment> result = commentService.getPaginatedCommentListByUserGroups(pageNumber, DEFAULT_PAGE_SIZE, tags);

        model.addAttribute("queryResult", result);

        model.addAttribute("tagNames", TAG_NAMES);
        model.addAttribute("commentsTags", getCommentsTags());

        if (!CollectionUtils.isEmpty(tags)) {
            Map<String, String> tagsMap = new HashMap<String, String>(tags.size());
            for (String tag : tags) {
                tagsMap.put(tag, "true");
            }
            model.addAttribute("tagsMap", tagsMap);
        }

        if (result.getTotal() == 0) {
            return;
        }

        List<Comment> comments = result.getList();
        Map<String, String> userGroupNames = getUserGroupNames();

        model.addAttribute("userGroupNames", userGroupNames);
        model.addAttribute("shareGroupNames", getShareGroupNames(comments, userGroupNames));

        model.addAttribute("bsnIds", getBsnIds(comments));
        model.addAttribute("postIdCounts", getPostIdCounts(comments));
    }

    /**
     * Получает карту групп для комментариев. Карта содержит только группы в
     * которых состоит текущий пользователь.
     */
    private Map<String, List<String>> getShareGroupNames(List<Comment> comments, Map<String, String> groupNames) {
        Map<String, List<String>> result = new HashMap<String, List<String>>(comments.size());
        for (Comment c : comments) {
            Set<String> shareGroups = c.getScope().getShareGroups();
            List<String> names = new ArrayList<String>(shareGroups.size());
            for (String s : shareGroups) {
                String groupName = groupNames.get(s);
                if (groupName != null) {
                    names.add(groupName);
                }
            }
            Collections.sort(names);
            result.put(c.getId(), names);
        }
        return result;
    }

    private Map<String, String> getUserGroupNames() {
        List<Group> shareGroups = userService.getUserInfo().getShareGroups();
        Map<String, String> groupNames = new HashMap<String, String>(shareGroups.size());
        for (Group group : shareGroups) {
            groupNames.put(group.getId(), group.getName());
        }
        return groupNames;
    }

    private Map<String, String> getBsnIds(List<Comment> comments) {
        Map<String, String> result = new HashMap<String, String>();
        for (Comment c : comments) {
            String postId = c.getPostId();
            String bsnId = PostIdUtils.extractBsnId(postId);
            if (bsnId != null) {
                result.put(c.getId(), bsnId);
            }
        }
        return result;
    }

    private Map<String, PostInfo> getPostIdCounts(List<Comment> comments) {

        Set<String> postIdSet = new HashSet<String>();
        for (Comment c : comments) {
            postIdSet.add(c.getPostId());
        }

        List<PostInfo> listPostInfo = commentService.getPostInfo(postIdSet);
        Map<String, PostInfo> result = new HashMap<String, PostInfo>();

        for (PostInfo postInfo : listPostInfo) {
            result.put(postInfo.getPostId(), postInfo);
        }
        return result;
    }

    private Map<String, Map<String, String>> getCommentsTags() {
        Map<String, Map<String, String>> commentsTags = new HashMap<String, Map<String, String>>();

        for (int i = 0; i < TAG_NAMES.size(); i++) {
            String tagName = TAG_NAMES.get(i);

            Map<String, String> tag = new  HashMap<String, String>();
            tag.put("id", Integer.toString(i + 1));

            commentsTags.put(tagName, tag);
        }

        return commentsTags;
    }
}
