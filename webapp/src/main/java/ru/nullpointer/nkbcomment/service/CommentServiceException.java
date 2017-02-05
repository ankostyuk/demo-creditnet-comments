package ru.nullpointer.nkbcomment.service;

/**
 *
 * @author Alexander Yastrebov
 */
public class CommentServiceException extends RuntimeException {

    private static final long serialVersionUID = 20111118;

    public CommentServiceException() {
    }

    public CommentServiceException(String message) {
        super(message);
    }
}
