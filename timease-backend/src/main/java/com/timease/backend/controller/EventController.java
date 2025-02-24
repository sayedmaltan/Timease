package com.timease.backend.controller;

import com.timease.backend.Service.EventService;
import com.timease.backend.model.DTO.EventDTO;
import com.timease.backend.model.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/event")
public class EventController {

    @Autowired
    private EventService eventService;

    @PostMapping("")
    public ResponseEntity<?> createEvent(@RequestBody EventDTO event) {
        return ResponseEntity.ok(eventService.createEvent(event));
    }

    @GetMapping
    public ResponseEntity<?> getAllEvents() {
        return ResponseEntity.ok(eventService.getAllEvents());
    }

    @GetMapping("/{evenId}")
    public ResponseEntity<Event> getEventById(@PathVariable UUID evenId) {
        return ResponseEntity.ok(eventService.getEventById(evenId));
    }

    @GetMapping("/user/{userId}")
    public ResponseEntity<?> getUserEvents(@PathVariable UUID userId) {
        return ResponseEntity.ok(eventService.getEventsForUser(userId));
    }
}
