package com.timease.backend.repository;

import com.timease.backend.model.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.awt.print.Pageable;
import java.util.List;
import java.util.UUID;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, UUID> {

    @Query("SELECT n FROM Notification n WHERE n.isSent = false ORDER BY n.createdAt ASC LIMIT 50")
    List<Notification> findUnsentNotifications();

    @Query("SELECT n FROM Notification n WHERE n.isSent = false and n.userId = :userId ORDER BY n.createdAt Desc")
    List<Notification> findByUserIdOrderByCreatedAtDesc(UUID userId);

    long countByUserIdAndIsSentFalse(UUID userId);

    boolean existsByUserIdAndPayload(UUID userId, String payload);

}