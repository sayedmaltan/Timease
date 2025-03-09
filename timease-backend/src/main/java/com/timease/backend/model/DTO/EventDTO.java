package com.timease.backend.model.DTO;

import com.timease.backend.model.Availability;
import lombok.*;
import java.util.List;
import java.util.UUID;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EventDTO {
    private UUID id;
    private String title;
    private String description;
    private String location;
    private int duration;
    private int maxAttendees;
    private int schedulingRange;
    private boolean isPeriodic;
    private List<Availability> availabilities;
}
