package com.feedbacksystem.app.repository;

import com.feedbacksystem.app.entity.Feedback;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FeedbackRepository extends JpaRepository<Feedback, Long> {
}
