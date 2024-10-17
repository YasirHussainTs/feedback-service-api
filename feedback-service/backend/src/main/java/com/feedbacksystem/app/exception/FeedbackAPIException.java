package com.feedbacksystem.app.exception;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FeedbackAPIException extends RuntimeException {
    private String message;

    public FeedbackAPIException(String message) {
        super(message);
        this.message = message;
    }
}
