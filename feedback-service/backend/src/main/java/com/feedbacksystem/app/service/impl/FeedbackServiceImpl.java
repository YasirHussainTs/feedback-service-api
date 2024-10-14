package com.feedbacksystem.app.service.impl;

import com.feedbacksystem.app.dto.FeedbackDto;
import com.feedbacksystem.app.entity.Feedback;
import com.feedbacksystem.app.repository.FeedbackRepository;
import com.feedbacksystem.app.service.FeedbackService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    private FeedbackRepository feedbackRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public FeedbackDto addFeedback(FeedbackDto feedbackDto) {
        /*if(feedbackDto.getRating() < 0 || feedbackDto.getRating() > 5) {
            throw new FeedbackAPIException("Rating must be between 0 and 5");
        }*/

        Feedback feedback = modelMapper.map(feedbackDto, Feedback.class);
        Feedback savedFeedback = feedbackRepository.save(feedback);
        return modelMapper.map(savedFeedback, FeedbackDto.class);
    }

    @Override
    public List<FeedbackDto> getAllFeedback() {
        List<Feedback> feedbackList = feedbackRepository.findAll();
        return feedbackList.stream()
                .map(feedback -> modelMapper.map(feedback, FeedbackDto.class))
                .collect(Collectors.toList());
    }
}
