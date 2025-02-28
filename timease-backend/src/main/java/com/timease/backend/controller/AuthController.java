package com.timease.backend.controller;

import com.timease.backend.Service.RefreshTokenService;
import com.timease.backend.Service.UserDetailsImpl;
import com.timease.backend.Service.UserDetailsServiceImpl;
import com.timease.backend.model.Enum.ERole;
import com.timease.backend.model.RefreshToken;
import com.timease.backend.model.Role;
import com.timease.backend.model.User;
import com.timease.backend.payload.*;
import com.timease.backend.repository.RoleRepository;
import com.timease.backend.security.jwt.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtUtils jwtUtils;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserDetailsServiceImpl userService;

    @Autowired
    private RefreshTokenService refreshTokenService;

    @PostMapping("/login")
    public ResponseEntity<?> authenticateUser(@RequestBody LoginRequest loginRequest) {
        if (!userService.existsByEmail(loginRequest.getEmail())) {
            return ResponseEntity.badRequest().body(new MessageResponse("Error: User Not Found"));

        }
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getEmail(), loginRequest.getPassword()));

        SecurityContextHolder.getContext().setAuthentication(authentication);
        String accessToken = jwtUtils.generateJwtToken(authentication.getName());

        User user = userService.findByEmail(loginRequest.getEmail())
                .orElseThrow(() -> new RuntimeException("Error: User not found."));

        if (refreshTokenService.findByUser(user).isPresent()){
            refreshTokenService.deleteByUser(user);
        }
        RefreshToken refreshToken = refreshTokenService.createRefreshToken(user);

        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        List<String> roles = userDetails.getAuthorities().stream().map(item -> item.getAuthority())
                .collect(Collectors.toList());

        System.out.println("User " + user.getEmail() + " Loged in");
        return ResponseEntity.ok(new JwtResponse(accessToken, refreshToken.getToken(), "Bearer",
                userDetails.getId(), userDetails.getUsername(), roles));
    }

    @PostMapping("/signup")
    public ResponseEntity<?> registerUser(@RequestBody SignupRequest signupRequest) {
        if (userService.existsByEmail(signupRequest.getEmail())) {
            return ResponseEntity.badRequest().body(new MessageResponse("Error: Email is already in use!"));

        }

        User user = new User(
                signupRequest.getFirstName(),
                signupRequest.getLastName(),
                signupRequest.getEmail(),
                passwordEncoder.encode(signupRequest.getPassword()),
                true // Assuming new accounts are enabled by default
        );
        Set<Role> roles = new HashSet<>();
        Role studentRepRole = roleRepository.findByName(ERole.ROLE_USER)
                .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
        roles.add(studentRepRole);
        user.setRoles(roles);

        userService.saveUser(user);
        return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
    }

    @PostMapping("/refresh-token")
    public ResponseEntity<?> refreshAccessToken(@RequestBody RefreshRequest request) {
        RefreshToken refreshToken = refreshTokenService.findByToken(request.getRefreshToken())
                .orElseThrow(() -> new RuntimeException("Error: Invalid refresh token!"));

        if (refreshTokenService.isExpired(refreshToken)) {
            refreshTokenService.deleteByUser(refreshToken.getUser());
            return ResponseEntity.badRequest().body(new MessageResponse("Error: Refresh token expired!"));
        }

        String newAccessToken = jwtUtils.generateJwtToken(refreshToken.getUser().getEmail());

        return ResponseEntity.ok(new JwtResponse(newAccessToken, refreshToken.getToken(), "Bearer", null,
                refreshToken.getUser().getEmail(), null));
    }

    @PostMapping("/logout")
    public ResponseEntity<?> logoutUser(@RequestBody RefreshRequest request) {
        RefreshToken refreshToken = refreshTokenService.findByToken(request.getRefreshToken())
                .orElseThrow(() -> new RuntimeException("Error: Invalid refresh token!"));

        refreshTokenService.deleteByUser(refreshToken.getUser());

        return ResponseEntity.ok(new MessageResponse("User logged out successfully!"));
    }

}
