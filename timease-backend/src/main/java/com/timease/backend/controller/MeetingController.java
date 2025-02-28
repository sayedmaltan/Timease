//package com.timease.backend.controller;
//
//import com.timease.backend.Service.MeetingService;
//import com.timease.backend.model.Meeting;
//import lombok.RequiredArgsConstructor;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//import java.util.UUID;
//
//@RestController
//@RequestMapping("/api/v1/meetings")
//@RequiredArgsConstructor
//public class MeetingController {
//    private final MeetingService meetingService;
//
//    @GetMapping("/available/{eventId}")
//    public ResponseEntity<List<Meeting>> getAvailableMeetings(@PathVariable UUID eventId) {
//        return ResponseEntity.ok(meetingService.getAvailableMeetings(eventId));
//    }
//
//    @PostMapping("/book/{meetingId}/{userId}")
//    public ResponseEntity<Meeting> bookMeeting(@PathVariable UUID meetingId, @PathVariable UUID userId) {
//        return ResponseEntity.ok(meetingService.bookMeeting(meetingId, userId));
//    }
//}
