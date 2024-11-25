package com.timease.backend.Service;

import com.timease.backend.model.RefreshToken;
import com.timease.backend.model.User;
import com.timease.backend.repository.RefreshTokenRepository;
import com.timease.backend.security.jwt.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Optional;
import java.util.UUID;

@Service
public class RefreshTokenService {

    @Autowired
    private RefreshTokenRepository refreshTokenRepository;

    @Autowired
    private JwtUtils jwtUtils;

    @Value("${jwt.refreshExpirationMs}")
    private  long refreshTokenDurationMs; // 1 Month

    public RefreshToken createRefreshToken(User user) {
        String token = jwtUtils.generateRefreshToken(user.getEmail());
        RefreshToken refreshToken = new RefreshToken(
                user,
                token,
                new Date((new Date()).getTime() + refreshTokenDurationMs)
        );
        return refreshTokenRepository.save(refreshToken);
    }

    public Optional<RefreshToken> findByToken(String token) {
        return refreshTokenRepository.findByToken(token);
    }
    public Optional<RefreshToken> findByUser(User user) {
        return refreshTokenRepository.findByUser(user);
    }

    public void deleteByUser(User user) {
        refreshTokenRepository.deleteByUser(user.getId());
    }

    public boolean isExpired(RefreshToken refreshToken) {
        return refreshToken.getExpiryDate().before(new Date());
    }
}
