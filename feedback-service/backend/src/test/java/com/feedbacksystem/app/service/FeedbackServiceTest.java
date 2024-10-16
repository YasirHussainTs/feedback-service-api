package com.feedbacksystem.app.service;

import com.feedbacksystem.app.dto.FeedbackDto;
import com.feedbacksystem.app.service.impl.FeedbackServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

class FeedbackServiceTest {
    @Mock
    private FeedbackService feedbackService;

    @InjectMocks
    private FeedbackServiceImpl feedbackServiceImpl;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testAddFeedback() {
        // Arrange
        FeedbackDto feedbackDto = new FeedbackDto();
        feedbackDto.setComment("Great Service!");

        when(feedbackService.addFeedback(feedbackDto)).thenReturn(feedbackDto);

        // Act
        FeedbackDto result = feedbackServiceImpl.addFeedback(feedbackDto);

        // Assert
        assertEquals("Great Service!", result.getComment());
        verify(feedbackService, times(1)).addFeedback(feedbackDto);
    }

    @Test
    void testGetAllFeedback() {
        // Arrange
        FeedbackDto feedback1 = new FeedbackDto();
        feedback1.setComment("Excellent!");
        FeedbackDto feedback2 = new FeedbackDto();
        feedback2.setComment("Needs improvement.");

        List<FeedbackDto> feedbackList = new ArrayList<>();
        feedbackList.add(feedback1);
        feedbackList.add(feedback2);

        when(feedbackService.getAllFeedback()).thenReturn(feedbackList);

        // Act
        List<FeedbackDto> result = feedbackServiceImpl.getAllFeedback();

        // Assert
        assertEquals(2, result.size());
        assertEquals("Excellent!", result.get(0).getComment());
        assertEquals("Needs improvement.", result.get(1).getComment());
        verify(feedbackService, times(1)).getAllFeedback();
    }
}
