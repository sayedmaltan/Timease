package com.timease.backend.Service;

import com.timease.backend.model.Event;
import com.timease.backend.model.User;
import com.timease.backend.model.DTO.EventDTO;
import com.timease.backend.model.Availability;
import com.timease.backend.repository.EventRepository;
import com.timease.backend.repository.UserRepository;
import com.timease.backend.repository.AvailabilityRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class EventService {

    private final EventRepository eventRepository;
    private final UserRepository userRepository;
    private final AvailabilityRepository availabilityRepository;

    @Transactional
    public Event createEvent(EventDTO eventDTO) {
        User user = userRepository.findById(eventDTO.getUser_id())
                .orElseThrow(() -> new RuntimeException("User not found"));

        Event event = new Event();
        event.setUser(user);
        event.setTitle(eventDTO.getTitle());
        event.setDescription(eventDTO.getDescription());
        event.setLocation(eventDTO.getLocation());
        event.setLength(eventDTO.getLength());
        event.setMaxAttendees(eventDTO.getMaxAttendees());
        event.setSchedulingRange(eventDTO.getSchedulingRange());
        Event savedEvent = eventRepository.save(event);

        // Save availability records linked to this event
        List<Availability> availabilityList = eventDTO.getAvailability().stream()
                .map(a -> {
                    Availability availability = new Availability();
                    availability.setEvent(savedEvent);
                    availability.setDayOfWeek(a.getDayOfWeek());
                    availability.setStartTime(a.getStartTime());
                    availability.setEndTime(a.getEndTime());
                    return availability;
                })
                .collect(Collectors.toList());

        availabilityRepository.saveAll(availabilityList);

        return savedEvent;
    }

    public  Map<String,Object> getAllEvents() {

        List<Event> events = eventRepository.findAll();;
        Map<String,Object> response = new HashMap<>();
        response.put("eventsNo",events.size());
        response.put("events", events);
        return response;
    }

    public Event getEventById(UUID id) {
        return eventRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Event not found"));
    }

    public  Map<String,Object> getEventsForUser(UUID userId) {
        List<Event> events = eventRepository.findByUserId(userId);;
        Map<String,Object> response = new HashMap<>();
        response.put("eventsNo",events.size());
        response.put("events", events);
        return response;
    }
}
