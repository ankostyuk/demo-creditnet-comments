package ru.nullpointer.nkbcomment.domain;

import java.util.Date;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.springframework.data.annotation.Transient;

/**
 *
 * @author Alexander Yastrebov
 */
public class Verification {

    private boolean verified;
    //
    @Transient
    private String verifierName;
    private String verifierId;
    //
    private Date updated;

    public boolean isVerified() {
        return verified;
    }

    public void setVerified(boolean verified) {
        this.verified = verified;
    }

    public String getVerifierName() {
        return verifierName;
    }

    public void setVerifierName(String verifierName) {
        this.verifierName = verifierName;
    }

    public String getVerifierId() {
        return verifierId;
    }

    public void setVerifierId(String verifierId) {
        this.verifierId = verifierId;
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
