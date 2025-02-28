package com.timease.backend.Service;

import com.timease.backend.model.Event;
import com.timease.backend.model.User;
import com.timease.backend.model.DTO.EventDTO;
import com.timease.backend.model.Availability;
import com.timease.backend.repository.EventRepository;
import com.timease.backend.repository.UserRepository;
import com.timease.backend.repository.AvailabilityRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
    private final AuthService authService;


    public  Map<String,Object> getAllEvents() {

        List<Event> events = eventRepository.findAll();;
        Map<String,Object> response = new HashMap<>();
        response.put("eventsNo",events.size());
        response.put("events", events);
        return response;
    }

    public  Map<String,Object> getUserEvents() {
        UUID userId = authService.getCurrentUserId();
        if (userId==null){
            throw new EntityNotFoundException("User not found");
        }
        List<Event> events = eventRepository.findByUserId(userId);
        Map<String,Object> response = new HashMap<>();
        response.put("eventsNo",events.size());
        response.put("events", events);
        return response;
    }


    @Transactional
    public Event createEvent(EventDTO eventDTO) {
        UUID userId = authService.getCurrentUserId();
        if (userId==null){
            throw new EntityNotFoundException("User not found");
        }
        User user = userRepository.findById(userId).orElseThrow();

        Event event = new Event();
        event.setUser(user);
        event.setTitle(eventDTO.getTitle());
        event.setDescription(eventDTO.getDescription());
        event.setLocation(eventDTO.getLocation());
        event.setDuration(eventDTO.getDuration());
        event.setMaxAttendees(eventDTO.getMaxAttendees());
        event.setSchedulingRange(eventDTO.getSchedulingRange());
        event.setPeriodic(eventDTO.isPeriodic());
        Event savedEvent = eventRepository.save(event);

        // Save availability records linked to this event
        List<Availability> availabilityList = eventDTO.getAvailabilities().stream()
                .map(a -> {
                    Availability availability = new Availability();
                    availability.setEvent(savedEvent);
                    availability.setDate(a.getDate());
                    availability.setDayOfWeek(a.getDayOfWeek());
                    availability.setStartTime(a.getStartTime());
                    availability.setEndTime(a.getEndTime());
                    return availability;
                })
                .collect(Collectors.toList());

        availabilityRepository.saveAll(availabilityList);

        return savedEvent;
    }



    @Transactional
    public Event updateEvent(UUID eventId, EventDTO request) {
        Event event = eventRepository.findById(eventId)
                .orElseThrow(() -> new EntityNotFoundException("Event not found"));

        UUID userId = authService.getCurrentUserId();
        if (!event.getUser().getId().equals(userId)) {
            throw new SecurityException("Unauthorized to update this event");
        }

        event.setTitle(request.getTitle());
        event.setDescription(request.getDescription());
        event.setLocation(request.getLocation());
        event.setDuration(request.getDuration());
        event.setMaxAttendees(request.getMaxAttendees());
        event.setSchedulingRange(request.getSchedulingRange());
        event.setPeriodic(request.isPeriodic());

        // Clear the existing availabilities and add the new ones
        event.getAvailabilities().clear();
        if (request.getAvailabilities() != null) {
            request.getAvailabilities().forEach(a -> {
                Availability availability = new Availability();
                availability.setEvent(event);
                availability.setDate(a.getDate());
                availability.setDayOfWeek(a.getDayOfWeek());
                availability.setStartTime(a.getStartTime());
                availability.setEndTime(a.getEndTime());
                event.getAvailabilities().add(availability);
            });
        }

        return eventRepository.save(event);
    }

    public void deleteEvent(UUID eventId) {
        Event event = eventRepository.findById(eventId)
                .orElseThrow(() -> new EntityNotFoundException("Event not found"));

        UUID userId = authService.getCurrentUserId();
        if (!event.getUser().getId().equals(userId)) {
            throw new SecurityException("Unauthorized to delete this event");
        }
        // TO DO -> delete meetings
        eventRepository.delete(event);
    }

}
