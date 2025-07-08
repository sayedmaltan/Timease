import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();
  final bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  Future<void> initNotification({
    required void Function(Map<String, dynamic> payload) onNotificationClick,
  }) async {
    const AndroidInitializationSettings initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    final initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
    );

    await notificationPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (response.payload != null) {
          final data = jsonDecode(response.payload!);
          onNotificationClick(data);
        }
      },
    );
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id',
          'your channel name',
          channelDescription: 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails());
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    Map<String, dynamic>? payloadData,
  }) {
    final payload = payloadData != null ? jsonEncode(payloadData) : null;

    return notificationPlugin.show(
      id,
      title,
      body,
      notificationDetails(),
      payload: payload,
    );
  }
}
