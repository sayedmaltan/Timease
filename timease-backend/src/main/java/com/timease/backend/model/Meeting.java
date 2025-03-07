package com.timease.backend.model;


import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.*;
import java.util.UUID;

@Getter
@Setter
@Entity
public class Meeting {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    @ManyToOne
    @JsonIgnore
    private Event event;

    @ManyToMany
    private List<User> attendees = new ArrayList<>();

    private LocalDate date;
    private LocalTime startTime;
    private LocalTime endTime;

    public boolean isAvailable() {
        return attendees.size() < event.getMaxAttendees();
    }
}
