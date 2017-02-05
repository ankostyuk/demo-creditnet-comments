package ru.nullpointer.nkbcomment.domain;

import java.util.Date;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.springframework.data.annotation.Transient;

/**
 *
 * @author Alexander Yastrebov
 */
public class Moderation {

    public static enum Status {

        PENDING,
        APPROVED,
        REJECTED
    }
    private Status status;
    //
    @Transient
    private String moderatorName;
    private String moderatorId;
    //
    private String rejectionReason;
    private Date updated;

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public String getModeratorName() {
        return moderatorName;
    }

    public void setModeratorName(String moderatorName) {
        this.moderatorName = moderatorName;
    }

    public String getModeratorId() {
        return moderatorId;
    }

    public void setModeratorId(String moderatorId) {
        this.moderatorId = moderatorId;
    }

    public String getRejectionReason() {
        return rejectionReason;
    }

    public void setRejectionReason(String rejectionReason) {
        this.rejectionReason = rejectionReason;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
