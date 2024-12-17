package com.timease.backend.model;

import com.timease.backend.model.Enum.EventType;
import jakarta.persistence.*;
import lombok.*;
import java.util.List;
import java.util.UUID;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Event {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "host_id", nullable = false)
    private User host;

    private String title;

    private String description;

    private Integer isEnabled;

    private String location; // fix

    @Enumerated(EnumType.STRING)
    private EventType type; // ONLINE or OFFLINE

    @OneToMany(mappedBy = "event", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Availability> availability;
}