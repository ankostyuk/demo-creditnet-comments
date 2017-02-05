package ru.nullpointer.nkbcomment.service;

/**
 *
 * @author Alexander Yastrebov
 */
public class BadArgumentException extends CommentServiceException {

    private static final long serialVersionUID = 20111118;

    public BadArgumentException() {
    }

    public BadArgumentException(String message) {
        super(message);
    }
}
