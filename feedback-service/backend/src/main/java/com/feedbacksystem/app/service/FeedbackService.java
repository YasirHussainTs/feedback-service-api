package com.feedbacksystem.app.service;

import com.feedbacksystem.app.dto.FeedbackDto;

import java.util.List;

public interface FeedbackService {
    FeedbackDto addFeedback(FeedbackDto feedbackDto);
    List<FeedbackDto> getAllFeedback();
}
