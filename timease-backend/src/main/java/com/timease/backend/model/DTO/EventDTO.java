package com.timease.backend.model.DTO;

import com.timease.backend.model.Availability;
import com.timease.backend.model.Enum.EventType;
import com.timease.backend.model.User;
import jakarta.persistence.*;
import lombok.*;

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

    private Integer isEnabled;

    private String location;

    @Enumerated(EnumType.STRING)
    private EventType type; // ONLINE or OFFLINE

    private List<Availability> availability;
}
