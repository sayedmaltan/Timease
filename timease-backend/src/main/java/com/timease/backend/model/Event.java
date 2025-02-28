package com.timease.backend.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.Duration;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Event {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    private String title;
    private String description;
    private String location;

    @Column(nullable = false)
    private int duration; // Duration of the meeting minutes

    private int maxAttendees; // Maximum number of attendees

    private int schedulingRange;

    private boolean isPeriodic; // Is the event periodic
    @OneToMany(mappedBy = "event", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Availability> availabilities; // Linked availability slots
}
