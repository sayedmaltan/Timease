package com.timease.backend.controller;

import com.timease.backend.Service.MeetingService;
import com.timease.backend.model.DTO.MeetingRequestDTO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/api/meeting")
public class MeetingController {

    private final MeetingService meetingService;

    public MeetingController(MeetingService meetingService) {
        this.meetingService = meetingService;
    }

    @PostMapping
    public ResponseEntity<?> createMeeting(@RequestBody MeetingRequestDTO meetingRequest) {
        return ResponseEntity.ok(meetingService.createOrUpdateMeeting(meetingRequest));
    }
    @GetMapping("/eventMeetings")
    public ResponseEntity<?> getEventMeetings(@RequestParam UUID eventId) {
        return ResponseEntity.ok(meetingService.getEventMeetings(eventId));
    }

    @GetMapping("/userBookings")
    public ResponseEntity<?> getUserBookings() {
        return ResponseEntity.ok(meetingService.getUserBookings());
    }

    @GetMapping("/userMeetings")
    public ResponseEntity<?> getUserMeetings() {
        return ResponseEntity.ok(meetingService.getUserMeetings());
    }

    @GetMapping("/fullMeeting")
    public ResponseEntity<?> getFullMeetings(@RequestParam UUID availabilityId, @RequestParam LocalDate date) {
        return ResponseEntity.ok(meetingService.getFullMeetings(availabilityId, date));
    }
    @GetMapping("/meetingTitles")
    public ResponseEntity<?> getMeetingTitles(@RequestBody Map<String,Object> req) {
        return ResponseEntity.ok(meetingService.getEventTitlesByMeetingIds((List<UUID>) req.get("list")));
    }

    @DeleteMapping
    public ResponseEntity<?> deleteMeeting(@RequestParam UUID meetingId) {
        meetingService.removeUserFromMeeting(meetingId);
        return ResponseEntity.noContent().build();
    }
}