package com.timease.backend.model.DTO;


import lombok.*;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AvailabilityDTO {
    private UUID id;
    private DayOfWeek dayOfWeek;
    private LocalDate date;
    private LocalTime startTime;
    private LocalTime endTime;
}
