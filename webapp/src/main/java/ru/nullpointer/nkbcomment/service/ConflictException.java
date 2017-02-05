package ru.nullpointer.nkbcomment.service;

/**
 *
 * @author Alexander Yastrebov
 */
public class ConflictException extends CommentServiceException {

    private static final long serialVersionUID = 20111124;

    public ConflictException() {
    }

    public ConflictException(String message) {
        super(message);
    }
}
