package ru.nullpointer.nkbcomment.domain;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlRootElement;
import org.apache.commons.lang.builder.ToStringBuilder;

/**
 *
 * @author Alexander Yastrebov
 */
@XmlRootElement
public class Post {

    private String id;
    private List<Comment> comments = new ArrayList<Comment>();

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void addComment(Comment comment) {
        comments.add(comment);
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
