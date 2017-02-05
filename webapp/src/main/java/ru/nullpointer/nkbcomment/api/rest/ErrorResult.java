package ru.nullpointer.nkbcomment.api.rest;

import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Alexander Yastrebov
 */
@XmlRootElement
public class ErrorResult {

    private Error error = new Error();

    public ErrorResult() {
    }

    public ErrorResult(String message) {
        error.setMessage(message);
    }

    public Error getError() {
        return error;
    }

    public void setError(Error error) {
        this.error = error;
    }

    public static class Error {

        private String message;

        public Error() {
        }

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }
    }
}
