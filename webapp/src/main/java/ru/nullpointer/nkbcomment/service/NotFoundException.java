package ru.nullpointer.nkbcomment.service;

/**
 *
 * @author Alexander Yastrebov
 */
public class NotFoundException extends CommentServiceException {

    private static final long serialVersionUID = 20111120;

    public NotFoundException() {
    }

    public NotFoundException(String message) {
        super(message);
    }
}
