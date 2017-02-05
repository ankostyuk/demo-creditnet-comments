package ru.nullpointer.nkbcomment.domain;

import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.xml.bind.annotation.XmlRootElement;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.springframework.data.annotation.Transient;
import ru.nullpointer.nkbcomment.security.domain.CommentPermission;

/**
 *
 * @author Alexander Yastrebov
 */
@XmlRootElement
public class Comment {

    private String id;
    private String postId;
    //
    @Transient
    private String authorName;
    private String authorId;
    //
    private Date created;
    //
    private String content;
    //
    private String title;
    //
    private Date edited;
    //
    private Scope scope;
    //
    private Moderation moderation;
    //
    private Verification verification;
    //
    private List<Attachment> attachments;
    //
    private Set<String> tags;
    //
    @Transient
    private Boolean removeTags;
    //
    @Transient
    private List<CommentPermission> permissions;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getAuthorId() {
        return authorId;
    }

    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getEdited() {
        return edited;
    }

    public void setEdited(Date edited) {
        this.edited = edited;
    }

    public Scope getScope() {
        return scope;
    }

    public void setScope(Scope scope) {
        this.scope = scope;
    }

    public Moderation getModeration() {
        return moderation;
    }

    public void setModeration(Moderation moderation) {
        this.moderation = moderation;
    }

    public Verification getVerification() {
        return verification;
    }

    public void setVerification(Verification verification) {
        this.verification = verification;
    }

    public List<Attachment> getAttachments() {
        return attachments;
    }

    public void setAttachments(List<Attachment> attachments) {
        this.attachments = attachments;
    }

    public Set<String> getTags() {
        return tags;
    }

    public void setTags(Set<String> tags) {
        this.tags = tags;
    }

    public Boolean getRemoveTags() {
        return removeTags;
    }

    public void setRemoveTags(Boolean removeTags) {
        this.removeTags = removeTags;
    }

    public List<CommentPermission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<CommentPermission> permissions) {
        this.permissions = permissions;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
