package ru.nullpointer.nkbcomment.api.rest;

import java.util.List;
import javax.annotation.Resource;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.Response;
import ru.nullpointer.nkbcomment.domain.Group;
import ru.nullpointer.nkbcomment.domain.UserInfo;
import ru.nullpointer.nkbcomment.service.UserService;

/**
 *
 * @author Alexander Yastrebov
 */
@Path("/users")
public class UserAPI {

    @Resource
    private UserService userService;

    /**
     * Get information about authenticated user
     * @return 
     *          Status: 200 OK<br>
     *          Response: UserInfo 
     */
    @GET
    @Path("/me/info")
    public Response getInfo() {
        UserInfo result = userService.getUserInfo();
        return Response.ok(result).build();
    }

    /**
     * Get user share group list
     * @param userId
     * @return 
     *      Status: 200 OK or 204 No Content<br>
     *      Response: List of groups
     */
    @GET
    @Path("/{userId}/info/share-groups")
    public Response getShareGroups(@PathParam("userId") String userId) {
        List<Group> result = userService.getShareGroupList(userId);
        return buildShareGroupListResponse(result);
    }

    private Response buildShareGroupListResponse(List<Group> groupList) {
        if (!groupList.isEmpty()) {
            GenericEntity<List<Group>> entity = new GenericEntity<List<Group>>(groupList) {
            };
            return Response.ok(entity).build();
        }
        return Response.noContent().build();
    }
}
