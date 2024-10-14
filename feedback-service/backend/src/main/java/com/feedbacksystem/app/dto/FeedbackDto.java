package com.feedbacksystem.app.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class FeedbackDto {
    private Long id;
    private String customerName;
    private String comment;
    private int rating; //rating out of 5
}
