package ru.nullpointer.nkbcomment.domain;

import org.apache.commons.lang.builder.ToStringBuilder;

import javax.activation.DataHandler;

/**
 *
 * @author Alexander Yastrebov
 */
public class StoredFile {

    private String id;
    private DataHandler dataHandler;
    private String filename;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public DataHandler getDataHandler() {
        return dataHandler;
    }

    public void setDataHandler(DataHandler dataHandler) {
        this.dataHandler = dataHandler;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
