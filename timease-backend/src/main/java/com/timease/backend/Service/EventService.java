package com.timease.backend.Service;

import com.timease.backend.model.DTO.EventDTO;
import com.timease.backend.model.Event;
import com.timease.backend.model.User;
import com.timease.backend.repository.EventRepository;
import com.timease.backend.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.webjars.NotFoundException;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class EventService {

    @Autowired
    private  EventRepository eventRepository;
    @Autowired
    private UserRepository userRepository;

    public Event createEvent(EventDTO event) {
        Optional<User> user = userRepository.findById(event.getUser_id());
        if (user.isEmpty()) {
            throw new NotFoundException("User not found");
        }
        Event e=new Event();
        e.setAvailability(event.getAvailability());
        e.setDescription(event.getDescription());
        e.setTitle(event.getTitle());
        e.setIsEnabled(event.getIsEnabled());
        e.setHost(user.get());
        e.setLocation(event.getLocation());
        e.setType(event.getType());
        return eventRepository.save(e);
    }

    public List<Event> getAllEvents() {
        return eventRepository.findAll();
    }

    public Event getEventById(UUID id) {
        return eventRepository.findById(id).orElseThrow(() -> new RuntimeException("Event not found"));
    }

    public void deleteEvent(UUID id) {
        eventRepository.deleteById(id);
    }
}