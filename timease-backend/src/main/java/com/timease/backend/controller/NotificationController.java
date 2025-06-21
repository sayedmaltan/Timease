package com.timease.backend.controller;


import com.timease.backend.model.DTO.BroadcastRequest;
import com.timease.backend.model.Notification;
import com.timease.backend.Service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/notifications")
public class NotificationController {

    @Autowired
    private NotificationService notificationService;

    @PostMapping("/broadcast")
    public ResponseEntity<Void> broadcastToEventAttendees(@RequestBody BroadcastRequest request) {
        notificationService.broadcastToEventAttendees(
                request.getEventId(),
                request.getTitle(),
                request.getMessage()
        );
        return ResponseEntity.ok().build();
    }


    @PostMapping("/create")
    public ResponseEntity<Notification> createNotification(@RequestBody CreateNotificationRequest request) {
        Notification notification = notificationService.createNotification(
                request.getUserId(),
                request.getTitle(),
                request.getMessage(),
                request.getNotificationType(),
                request.getPayload()
        );
        return ResponseEntity.ok(notification);
    }

    @GetMapping("/user/{userId}")
    public ResponseEntity<List<Notification>> getUserNotifications(@PathVariable UUID userId) {
        List<Notification> notifications = notificationService.getUserNotifications(userId);
        return ResponseEntity.ok(notifications);
    }

    @GetMapping("/unread-count/{userId}")
    public ResponseEntity<Long> getUnreadCount(@PathVariable UUID userId) {
        long count = notificationService.getUnreadNotificationCount(userId);
        return ResponseEntity.ok(count);
    }

    @PostMapping("/delivered/{notificationId}")
    public ResponseEntity<Void> markAsDelivered(@PathVariable UUID notificationId) {
        notificationService.markNotificationAsDelivered(notificationId);
        return ResponseEntity.ok().build();
    }

    // DTO for creating notifications
    public static class CreateNotificationRequest {
        private UUID userId;
        private String title;
        private String message;
        private String notificationType;
        private String payload;

        // Getters and setters
        public UUID getUserId() { return userId; }
        public void setUserId(UUID userId) { this.userId = userId; }
        public String getTitle() { return title; }
        public void setTitle(String title) { this.title = title; }
        public String getMessage() { return message; }
        public void setMessage(String message) { this.message = message; }
        public String getNotificationType() { return notificationType; }
        public void setNotificationType(String notificationType) { this.notificationType = notificationType; }
        public String getPayload() { return payload; }
        public void setPayload(String payload) { this.payload = payload; }
    }
}