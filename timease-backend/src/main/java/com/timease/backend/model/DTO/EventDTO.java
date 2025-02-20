package com.timease.backend.model.DTO;

import com.timease.backend.model.Availability;
import lombok.*;

import java.time.Duration;
import java.util.List;
import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class EventDTO {
    private UUID user_id;

    private String title;

    private String description;

    private String location;
    private int length;
    private int maxAttendees;

    private int schedulingRange;
    private List<Availability> availability;
}
