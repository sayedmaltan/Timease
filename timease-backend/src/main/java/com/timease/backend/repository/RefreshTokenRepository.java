package com.timease.backend.repository;

import com.timease.backend.model.RefreshToken;
import com.timease.backend.model.User;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;
import java.util.UUID;

public interface RefreshTokenRepository extends JpaRepository<RefreshToken, UUID> {
    Optional<RefreshToken> findByToken(String token);


//    Optional<RefreshToken> findByUserId(@Param("userId") UUID userId);

    Optional<RefreshToken> findByUser(User user);

    @Transactional
    @Modifying
    @Query("DELETE FROM RefreshToken r WHERE r.user.id = :userId")
    void deleteByUser(@Param("userId") UUID userId);
}
