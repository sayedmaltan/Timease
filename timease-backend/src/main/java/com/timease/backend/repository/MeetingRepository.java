package com.timease.backend.repository;

import com.timease.backend.model.Event;
import com.timease.backend.model.Meeting;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface MeetingRepository extends JpaRepository<Meeting, UUID> {
    List<Meeting> findByEventAndDateBetween(Event event, LocalDate startDate, LocalDate endDate);
    Optional<Meeting> findById(UUID meetingId);
}
