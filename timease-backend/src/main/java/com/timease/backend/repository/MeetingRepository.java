package com.timease.backend.repository;

import com.timease.backend.model.Meeting;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface MeetingRepository extends JpaRepository<Meeting, UUID> {

    @Query(value = """
        SELECT * FROM meeting 
        WHERE availability_id = :availabilityId 
        AND date = :date 
        AND start_time = :startTime 
        AND end_time = :endTime
    """, nativeQuery = true)
    Optional<Meeting> findByAvailability_IdAndDateAndStartTimeAndEndTime(
            @Param("availabilityId") UUID availabilityId,
            @Param("date") LocalDate date,
            @Param("startTime") LocalTime startTime,
            @Param("endTime") LocalTime endTime
    );

    @Query(value = """
        SELECT * FROM meeting 
        WHERE availability_id IN 
        (SELECT id FROM availability WHERE event_id = :eventId)
    """, nativeQuery = true)
    List<Meeting> findByAvailability_Event_Id(@Param("eventId") UUID eventId);

    @Query(value = """
        SELECT * FROM meeting 
        WHERE id IN 
        (SELECT meeting_id FROM meeting_attendees WHERE user_id = :userId)
    """, nativeQuery = true)
    List<Meeting> findByAttendees_Id(@Param("userId") UUID userId);

    @Query(value = """
        SELECT * FROM meeting 
        WHERE availability_id IN 
        (SELECT id FROM availability WHERE event_id IN 
        (SELECT id FROM event WHERE user_id = :creatorId)) 
        OR id IN 
        (SELECT meeting_id FROM meeting_attendees WHERE user_id = :attendeeId)
    """, nativeQuery = true)
    List<Meeting> findByAvailability_Event_User_IdOrAttendees_Id(
            @Param("creatorId") UUID creatorId,
            @Param("attendeeId") UUID attendeeId
    );

    @Query(value = """
        SELECT * FROM meeting 
        WHERE availability_id = :availabilityId 
        AND date = :date 
        AND (SELECT COUNT(*) FROM meeting_attendees WHERE meeting_id = meeting.id) >= :maxAttendees
    """, nativeQuery = true)
    List<Meeting> findByAvailability_IdAndDateAndAttendees_SizeGreaterThanEqual(
            @Param("availabilityId") UUID availabilityId,
            @Param("date") LocalDate date,
            @Param("maxAttendees") int maxAttendees
    );
}
