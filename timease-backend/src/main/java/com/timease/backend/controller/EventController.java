package com.timease.backend.controller;

import com.timease.backend.Service.EventService;
import com.timease.backend.model.DTO.EventDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.UUID;

@RestController
@RequestMapping("/api/event")
public class EventController {

    @Autowired
    private EventService eventService;

    @PostMapping
    public ResponseEntity<?> createEvent(@RequestBody EventDTO event) {
        return ResponseEntity.ok(eventService.createEvent(event));
    }

    @GetMapping("/all")
    public ResponseEntity<?> getAllEvents() {
        return ResponseEntity.ok(eventService.getAllEvents());
    }


    @GetMapping
    public ResponseEntity<?> getUserEvents() {
        return ResponseEntity.ok(eventService.getUserEvents());
    }

    @PutMapping("/{eventId}")
    public ResponseEntity<?> updateEvent(@PathVariable UUID eventId, @RequestBody EventDTO request) {
        return ResponseEntity.ok(eventService.updateEvent(eventId, request));
    }

    @DeleteMapping("/{eventId}")
    public ResponseEntity<Void> deleteEvent(@PathVariable UUID eventId) {
        eventService.deleteEvent(eventId);
        return ResponseEntity.noContent().build();
    }
}
