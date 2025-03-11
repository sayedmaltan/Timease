package com.timease.backend.model.DTO;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.UUID;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MeetingRequestDTO {
    UUID availabilityId;
    LocalDate date;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "H:mm:ss")
    private LocalTime startTime;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "H:mm:ss")

    LocalTime endTime;
}
