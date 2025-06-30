package com.timease.backend.Service;

import com.timease.backend.model.Availability;
import com.timease.backend.model.DTO.MeetingRequestDTO;
import com.timease.backend.model.Event;
import com.timease.backend.model.Meeting;
import com.timease.backend.model.User;
import com.timease.backend.repository.AvailabilityRepository;
import com.timease.backend.repository.EventRepository;
import com.timease.backend.repository.MeetingRepository;
import com.timease.backend.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.*;

@Service
public class MeetingService {

    private final MeetingRepository meetingRepository;
    private final AvailabilityRepository availabilityRepository;
    private final UserRepository userRepository;
    private final AuthService authService;
    private final EventRepository eventRepository;
    private final NotificationService notificationService;

    public MeetingService(MeetingRepository meetingRepository, AvailabilityRepository availabilityRepository, UserRepository userRepository, AuthService authService, EventRepository eventRepository, NotificationService notificationService) {
        this.meetingRepository = meetingRepository;
        this.availabilityRepository = availabilityRepository;
        this.userRepository = userRepository;
        this.authService = authService;
        this.eventRepository = eventRepository;
        this.notificationService = notificationService;
    }



    @Transactional
    public Meeting createOrUpdateMeeting(MeetingRequestDTO meetingRequest) {

        UUID availabilityId=meetingRequest.getAvailabilityId();
        LocalDate date=meetingRequest.getDate();
        LocalTime startTime=meetingRequest.getStartTime();
        LocalTime endTime=meetingRequest.getEndTime();
        UUID userId = authService.getCurrentUserId();
        User user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("User not found"));

        Event event = eventRepository.findEventByAvailabilityId(availabilityId);
        UUID host = event.getUser().getId();
        Optional<Meeting> existingMeeting = meetingRepository.findByAvailability_IdAndDateAndStartTimeAndEndTime(availabilityId, date, startTime, endTime);

        if (existingMeeting.isPresent()) {
            Meeting meeting = existingMeeting.get();
            if (!meeting.getAttendees().contains(user) && meeting.isAvailable()) {
                meeting.getAttendees().add(user);
                return meetingRepository.save(meeting);
            }
            notificationService.createNotification(host,
                    "New Booking!",
                    user.getFirst_name() + " " + user.getLast_name() + " has booked a meeting on " + date + " from " + startTime + " to " + endTime + " for your event :" + event.getTitle() ,
                    "MEETING_BOOKING",
                    "{}"
                    );
            return meeting;
        }

        Availability availability = availabilityRepository.findById(availabilityId)
                .orElseThrow(() -> new RuntimeException("Availability not found"));

        Meeting newMeeting = Meeting.builder()
                .availability(availability)
                .date(date)
                .startTime(startTime)
                .endTime(endTime)
                .attendees(List.of(user))
                .build();
        notificationService.createNotification(host,
                "New Booking!",
                user.getFirst_name() + " " + user.getLast_name() + " has booked a meeting on " + date + " from " + startTime + " to " + endTime + " for your event :" + event.getTitle() ,
                "MEETING_BOOKING",
                "{}"
        );
        return meetingRepository.save(newMeeting);
    }

    public HashMap<String,Object> getEventMeetings(UUID eventId) {
        List<Meeting> meetings =  meetingRepository.findByAvailability_Event_Id(eventId);
        HashMap<String,Object> res = new HashMap<>();
        res.put("meetingsNo", meetings.size());
        res.put("meetings", meetings);
        return res;
    }

    public HashMap<String,Object> getUserBookings() {
        UUID userId = authService.getCurrentUserId();
        List<Meeting> meetings = meetingRepository.findByAttendees_Id(userId);
        HashMap<String,Object> res = new HashMap<>();
        res.put("meetingsNo", meetings.size());
        res.put("meetings", meetings);
        return res;
    }

    public HashMap<String,Object> getUserMeetings() {
        UUID userId = authService.getCurrentUserId();
        List<Meeting> meetings = meetingRepository.findByAvailability_Event_User_IdOrAttendees_Id(userId, userId);
        HashMap<String,Object> res = new HashMap<>();
        res.put("meetingsNo", meetings.size());
        res.put("meetings", meetings);
        return res;
    }

    public Map<String,Object> getFullMeetings(UUID availabilityId, LocalDate date) {
        int maxAttendees = availabilityRepository.findById(availabilityId)
                .map(availability -> availability.getEvent().getMaxAttendees())
                .orElseThrow(() -> new RuntimeException("Availability not found"));
        List<Meeting> meetings = meetingRepository.findByAvailability_IdAndDateAndAttendees_SizeGreaterThanEqual(availabilityId, date, maxAttendees);

        Map<String,Object> res = new HashMap<>();
        res.put("meetingsNo", meetings.size());
        res.put("fullyBooked",meetings);
        return res;
    }

    @Transactional
    public void removeUserFromMeeting(UUID meetingId) {
        UUID userId = authService.getCurrentUserId();
        Meeting meeting = meetingRepository.findById(meetingId)
                .orElseThrow(() -> new RuntimeException("Meeting not found"));

        meeting.getAttendees().removeIf(user -> user.getId().equals(userId));

        if (meeting.getAttendees().isEmpty()) {
            meetingRepository.delete(meeting);
        } else {
            meetingRepository.save(meeting);
        }
    }

    public Map<String,String> getEventTitlesByMeetingIds(List<UUID> meetingIds) {
        List<Meeting> meetings = meetingRepository.findAllById(meetingIds);
        Map<String,String> res=new HashMap<>();
        for (Meeting meeting : meetings) {
            res.put(meeting.getId().toString(),meeting.getAvailability().getEvent().getTitle());
        }
        return res;
    }
}