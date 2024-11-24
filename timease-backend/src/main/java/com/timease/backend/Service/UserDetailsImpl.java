package com.timease.backend.Service;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.timease.backend.model.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.*;

public class UserDetailsImpl implements UserDetails {

    private UUID id;

    private String email;
    @JsonIgnore

    private String password;

    private boolean isAccountEnabled;


    private Collection<? extends GrantedAuthority> authorities;

    public UserDetailsImpl(UUID id, String email, String password,
                           boolean isAccountEnabled,
                           Collection<? extends GrantedAuthority> authorities) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.isAccountEnabled = isAccountEnabled;
        this.authorities = authorities;
    }

    public static UserDetailsImpl build(User user) {
        Set<GrantedAuthority> roles = new HashSet<>();
        user.getRoles().forEach((role) -> {
            roles.add(new SimpleGrantedAuthority(role.getName().name()));
        });
        ArrayList<GrantedAuthority> authorities = new ArrayList<>(roles);

        return new UserDetailsImpl(user.getId(),
                user.getEmail(),
                user.getPassword(),
                user.isAccountEnabled(),
                authorities);
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    public UUID getId() {
        return id;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return isAccountEnabled;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;
        UserDetailsImpl user = (UserDetailsImpl) o;
        return Objects.equals(id, user.id);
    }
}