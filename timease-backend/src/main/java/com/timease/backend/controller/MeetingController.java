package com.timease.backend.controller;

import com.timease.backend.Service.MeetingService;
import com.timease.backend.model.DTO.MeetingDTO;
import com.timease.backend.model.Meeting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/meetings")
public class MeetingController {

    @Autowired
    private MeetingService meetingService;


    @PostMapping
    public ResponseEntity<Meeting> scheduleMeeting(@RequestBody MeetingDTO meeting) {
        return ResponseEntity.ok(meetingService.scheduleMeeting(meeting));
    }

    @GetMapping
    public ResponseEntity<List<Meeting>> getAllMeetings() {
        return ResponseEntity.ok(meetingService.getAllMeetings());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Meeting> getMeetingById(@PathVariable UUID id) {
        return ResponseEntity.ok(meetingService.getMeetingById(id));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> cancelMeeting(@PathVariable UUID id) {
        meetingService.cancelMeeting(id);
        return ResponseEntity.noContent().build();
    }
}
