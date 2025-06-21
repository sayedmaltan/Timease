package com.timease.backend.Scheduler;

import com.timease.backend.Service.NotificationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class NotificationScheduler {

    private static final Logger logger = LoggerFactory.getLogger(NotificationScheduler.class);

    @Autowired
    private NotificationService notificationService;

    @Value("${notification.scheduler.enabled:true}")
    private boolean schedulerEnabled;

    // Configurable interval - default hour
    @Scheduled(fixedDelayString = "${notification.scheduler.interval}")
    public void processUnsentNotifications() {
        if (schedulerEnabled) {
            logger.debug("Running notification scheduler");
            notificationService.processUpComingNotifications();
        }
    }
}