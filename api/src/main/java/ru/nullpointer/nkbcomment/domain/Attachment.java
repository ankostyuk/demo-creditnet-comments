package ru.nullpointer.nkbcomment.domain;

import java.util.Date;
import javax.activation.DataHandler;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.springframework.data.annotation.Transient;

/**
 *
 * @author Alexander Yastrebov
 */
@XmlRootElement
public class Attachment {

    private String id;
    private String name;
    private String contentType;
    private Date created;
    private long size;
    //
    @Transient
    private DataHandler dataHandler;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public long getSize() {
        return size;
    }

    public void setSize(long size) {
        this.size = size;
    }

    @XmlTransient
    public DataHandler getDataHandler() {
        return dataHandler;
    }

    public void setDataHandler(DataHandler dataHandler) {
        this.dataHandler = dataHandler;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
