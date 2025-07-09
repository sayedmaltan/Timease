package com.timease.backend.Service;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.timease.backend.model.Meeting;
import com.timease.backend.model.Notification;
import com.timease.backend.model.User;
import com.timease.backend.repository.MeetingRepository;
import com.timease.backend.repository.NotificationRepository;
import com.timease.backend.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;

@Service
public class NotificationService {

    private static final Logger logger = LoggerFactory.getLogger(NotificationService.class);

    @Autowired
    private NotificationRepository notificationRepository;

    @Autowired
    private MeetingRepository meetingRepository;

    @Autowired
    private UserRepository userRepository;


    @Transactional
    public Notification createNotification(UUID userId, String title, String message,
                                           String notificationType, String payload) {
        Notification notification = new Notification(userId, title, message, notificationType, payload);
        return notificationRepository.save(notification);
    }

    @Transactional
    public void processUpComingNotifications() {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime next24h = now.plusHours(24);

        // Step 1: Fetch meetings that start in the next 24 hours
        List<Meeting> meetings = meetingRepository.findMeetingsStartingBetween(now, next24h);

        for (Meeting meeting : meetings) {
            UUID meetingId = meeting.getId();

            for (User user : meeting.getAttendees()) {
                UUID userId = user.getId();

                // Check if notification already exists
                boolean exists = notificationRepository.existsByUserIdAndPayload(userId, meetingId.toString());

                if (!exists) {
                    createNotification(
                            userId,
                            "Upcoming Meeting",
                            "You have a meeting starting soon.",
                            "MEETING_REMINDER",
                            meetingId.toString()
                    );
                }
            }
        }
    }



    @Transactional
    public void markNotificationAsDelivered(UUID notificationId) {
        notificationRepository.findById(notificationId).ifPresent(notification -> {
            notification.setIsSent(true);
            notificationRepository.save(notification);
            logger.info("Marked notification {} as delivered", notificationId);
        });
    }

    public Map<String,Object> getUserNotifications(UUID userId) {
        List<Notification> list = notificationRepository.findByUserIdOrderByCreatedAtDesc(userId);
        for (Notification n: list) {
            markNotificationAsDelivered(n.getId());
        }
        Map<String , Object> res=new HashMap<>();
        res.put("noOfNotifications", String.valueOf(list.size()));
        res.put("notifications", list);
        return res;
    }

    public long getUnreadNotificationCount(UUID userId) {
        return notificationRepository.countByUserIdAndIsSentFalse(userId);
    }

    @Transactional
    public void broadcastToEventAttendees(UUID eventId, String title, String message) {
        // Fetch all meetings related to the event
        List<Meeting> meetings = meetingRepository.findAllByEventId(eventId);

        for (Meeting meeting : meetings) {
            UUID meetingId = meeting.getId();
            for (User user : meeting.getAttendees()) {
                UUID userId = user.getId();


                createNotification(
                        userId,
                        title,
                        message,
                        "EVENT_BROADCAST",
                        meetingId.toString()
                );

            }
        }
    }


    // You need to implement this method based on your User entity
private String getUsernameFromUserId(UUID userId) {

    Optional<User> user= userRepository.findById(userId);
    if (user.isPresent())
        return user.get().getEmail();
    return null;
}

    // Inner class for notification payload
    public static class NotificationPayload {
        private String id;
        private String title;
        private String message;
        private String type;
        private String payload;
        private String timestamp;

        public NotificationPayload(String id, String title, String message, String type, String payload, String timestamp) {
            this.id = id;
            this.title = title;
            this.message = message;
            this.type = type;
            this.payload = payload;
            this.timestamp = timestamp;
        }

        // Getters and setters
        public String getId() { return id; }
        public void setId(String id) { this.id = id; }
        public String getTitle() { return title; }
        public void setTitle(String title) { this.title = title; }
        public String getMessage() { return message; }
        public void setMessage(String message) { this.message = message; }
        public String getType() { return type; }
        public void setType(String type) { this.type = type; }
        public String getPayload() { return payload; }
        public void setPayload(String payload) { this.payload = payload; }
        public String getTimestamp() { return timestamp; }
        public void setTimestamp(String timestamp) { this.timestamp = timestamp; }
    }
}