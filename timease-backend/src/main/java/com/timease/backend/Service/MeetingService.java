package com.timease.backend.Service;

import com.timease.backend.model.DTO.MeetingDTO;
import com.timease.backend.model.Event;
import com.timease.backend.model.Meeting;
import com.timease.backend.model.User;
import com.timease.backend.repository.EventRepository;
import com.timease.backend.repository.MeetingRepository;
import com.timease.backend.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.webjars.NotFoundException;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class MeetingService {

    @Autowired
    private  MeetingRepository meetingRepository;

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private EventRepository eventRepository;

    public Meeting scheduleMeeting(MeetingDTO meeting) {
        Optional<User> user = userRepository.findById(meeting.getInvitee());
        Optional<Event> event = eventRepository.findById(meeting.getEvent_id());
        if (user.isEmpty()) {
            throw new NotFoundException("User Not Found");
        }
        if (event.isEmpty()) {
            throw new NotFoundException("Event Not Found");
        }
        Meeting newMeeting = new Meeting();
        newMeeting.setEvent(event.get());
        newMeeting.setInvitee(user.get());
        newMeeting.setScheduledTime(meeting.getScheduledTime());
        return meetingRepository.save(newMeeting);
    }
    public List<Meeting> getAllMeetings() {
        return meetingRepository.findAll();
    }

    public Meeting getMeetingById(UUID id) {
        return meetingRepository.findById(id).orElseThrow(() -> new RuntimeException("Meeting not found"));
    }

    public void cancelMeeting(UUID id) {
        meetingRepository.deleteById(id);
    }
}