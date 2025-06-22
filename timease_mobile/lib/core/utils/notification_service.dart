import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();
  final bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  // initialize
  Future<void> initNotification() async {
    if (_isInitialized) return;

    //   prepare android init setting
    const AndroidInitializationSettings initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    //   prepare ios init setting
    const initSettingsIOS = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    //  init setting
    const initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
    );

    // init the plugin
    await notificationPlugin.initialize(initSettings);
  }

  // Notifications Details Setup
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

  // Show Notifications
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) {
    return notificationPlugin.show(id, title, body, notificationDetails());
  }
}
