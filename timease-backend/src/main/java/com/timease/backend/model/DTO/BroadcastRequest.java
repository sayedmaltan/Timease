package com.timease.backend.model.DTO;

import java.util.UUID;
public class BroadcastRequest {
    private UUID eventId;
    private String title;
    private String message;

    public UUID getEventId() { return eventId; }
    public void setEventId(UUID eventId) { this.eventId = eventId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
}