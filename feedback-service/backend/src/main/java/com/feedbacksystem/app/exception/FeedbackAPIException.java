package com.feedbacksystem.app.exception;

public class FeedbackAPIException extends RuntimeException {
    private String message;

    public FeedbackAPIException(String message) {
        super(message);
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
