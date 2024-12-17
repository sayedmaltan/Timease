package com.timease.backend.model.DTO;

import com.timease.backend.model.Event;
import com.timease.backend.model.User;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.UUID;

@Data
public class MeetingDTO {

    private UUID event_id;


    private UUID invitee;

    private LocalDateTime scheduledTime;
}
