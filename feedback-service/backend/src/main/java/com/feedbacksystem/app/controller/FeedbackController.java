package com.feedbacksystem.app.controller;

import com.feedbacksystem.app.dto.FeedbackDto;
import com.feedbacksystem.app.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/feedbacks")
public class FeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    @PostMapping()
    public ResponseEntity<FeedbackDto> addFeedback(@RequestBody FeedbackDto feedbackDto) {
        FeedbackDto savedFeedback = feedbackService.addFeedback(feedbackDto);
        return new ResponseEntity<>(savedFeedback, HttpStatus.CREATED);
    }

    @GetMapping()
    public List<FeedbackDto> getAllFeedback() {
        return feedbackService.getAllFeedback();
    }
}
