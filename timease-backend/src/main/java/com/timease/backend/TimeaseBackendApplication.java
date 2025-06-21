package com.timease.backend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class TimeaseBackendApplication {

	public static void main(String[] args) {
		SpringApplication.run(TimeaseBackendApplication.class, args);

		System.out.println("ALL IS FINE ==== UP AND RUNNING");
		System.out.println("ALL IS FINE ==== UP AND RUNNING");
	}

}
