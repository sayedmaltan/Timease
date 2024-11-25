package com.timease.backend.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;
import java.util.UUID;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RefreshToken {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(nullable = false, unique = true)
    private String token;

    @OneToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private Date expiryDate;

    public RefreshToken(User user, String token, Date expiryDate) {
        this.user = user;
        this.token = token;
        this.expiryDate = expiryDate;
    }
}
