package com.timease.backend.payload;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class RefreshRequest {


    @NotBlank
    private String refreshToken;

}
