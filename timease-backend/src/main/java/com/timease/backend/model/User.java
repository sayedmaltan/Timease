package com.timease.backend.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Entity(name = "_user")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;


    @NotBlank
    @NotNull
    private  String first_name;

    @NotBlank
    @NotNull
    private  String  last_name;

    private String birthdate;



    @JsonIgnore
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "user_roles", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles = new HashSet<>();

    @NotBlank
    @Column(unique = true)
    private String email;

    @JsonIgnore
    @NotBlank
    private String password;

    @CreationTimestamp
    private Date createdAt;

    @UpdateTimestamp
    private Date modifiedAt;


    @JsonIgnore
    private boolean isAccountEnabled;

    public User(String first_name , String last_name , String email, String password , boolean isAccountEnabled) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.password = password;
        this.isAccountEnabled = isAccountEnabled;
    }


}
