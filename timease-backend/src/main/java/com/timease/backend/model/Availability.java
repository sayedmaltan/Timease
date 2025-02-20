package com.timease.backend.model;



import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import java.time.DayOfWeek;
import java.time.LocalTime;
import java.util.UUID;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Availability {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "event_id", nullable = false)
    @JsonIgnore
    private Event event;

    @Enumerated(EnumType.STRING)
    private DayOfWeek dayOfWeek; // Example: MONDAY, TUESDAY, etc.

    private LocalTime startTime; // Available from
    private LocalTime endTime;   // Available until
}
