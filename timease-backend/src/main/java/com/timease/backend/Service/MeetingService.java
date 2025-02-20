package com.timease.backend.Service;

import com.timease.backend.model.Availability;
import com.timease.backend.model.Event;
import com.timease.backend.model.Meeting;
import com.timease.backend.model.User;
import com.timease.backend.repository.AvailabilityRepository;
import com.timease.backend.repository.EventRepository;
import com.timease.backend.repository.MeetingRepository;
import com.timease.backend.repository.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MeetingService {

    private final EventRepository eventRepository;
    private final MeetingRepository meetingRepository;
    private final AvailabilityRepository availabilityRepository;
    private final UserRepository userRepository;

    @Transactional
    public List<Meeting> getAvailableMeetings(UUID eventId) {
        Event event = eventRepository.findById(eventId)
                .orElseThrow(() -> new RuntimeException("Event not found"));

        LocalDate startDate = LocalDate.now();
        LocalDate endDate = startDate.plusDays(event.getSchedulingRange());

        List<Meeting> existingMeetings = meetingRepository.findByEventAndDateBetween(event, startDate, endDate);
        Set<LocalDate> generatedMeetingDates = existingMeetings.stream()
                .map(Meeting::getDate)
                .collect(Collectors.toSet());

        List<Meeting> meetings = new ArrayList<>(existingMeetings);

        // Get all availabilities for this event
        List<Availability> availabilities = availabilityRepository.findByEventId(event.getId());

        for (Availability availability : availabilities) {
            for (LocalDate date = startDate; date.isBefore(endDate); date = date.plusDays(1)) {
                if (date.getDayOfWeek() == availability.getDayOfWeek() && !generatedMeetingDates.contains(date)) {
                    generateMeetingsForDate(meetings, event, availability, date);
                }
            }
        }

        // Save new meetings and return available ones
        meetingRepository.saveAll(meetings);
        return meetings.stream()
                .filter(Meeting::isAvailable)
                .collect(Collectors.toList());
    }

    private void generateMeetingsForDate(List<Meeting> meetings, Event event, Availability availability, LocalDate date) {
        LocalTime startTime = availability.getStartTime();
        LocalTime endTime = availability.getEndTime();
        int duration = event.getLength();

        while (startTime.plusMinutes(duration).isBefore(endTime) || startTime.plusMinutes(duration).equals(endTime)) {
            Meeting meeting = new Meeting();
            meeting.setEvent(event);
            meeting.setDate(date);
            meeting.setStartTime(startTime);
            meeting.setEndTime(startTime.plusMinutes(duration));
            meetings.add(meeting);

            startTime = startTime.plusMinutes(duration);
        }
    }

    @Transactional
    public Meeting bookMeeting(UUID meetingId, UUID userId) {
        Meeting meeting = meetingRepository.findById(meetingId)
                .orElseThrow(() -> new RuntimeException("Meeting not found"));
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        if (!meeting.isAvailable()) {
            throw new RuntimeException("Meeting is full");
        }

        meeting.getAttendees().add(user);
        return meetingRepository.save(meeting);
    }
}
