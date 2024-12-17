package com.timease.backend.Service;


import com.timease.backend.model.Availability;
import com.timease.backend.repository.AvailabilityRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class AvailabilityService {

    private final AvailabilityRepository availabilityRepository;

    public AvailabilityService(AvailabilityRepository availabilityRepository) {
        this.availabilityRepository = availabilityRepository;
    }

    public Availability createAvailability(Availability availability) {
        return availabilityRepository.save(availability);
    }

    //TODO
    public List<Availability> getAvailabilitiesForEvent(UUID eventId) {
        return availabilityRepository.findByEventId(eventId);
    }

    //TODO
    public void deleteAvailability(UUID id) {
        availabilityRepository.deleteById(id);
    }
}