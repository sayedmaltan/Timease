package com.timease.backend.repository;

import com.timease.backend.model.Event;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.UUID;

public interface EventRepository extends JpaRepository<Event, UUID> {
    @Query(value = "SELECT * FROM event WHERE user_id = :userId", nativeQuery = true)
    List<Event> findByUserId(@Param("userId") UUID userId);
}

