import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();
  final bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  Future<void> initNotification() async {
    if (_isInitialized) return;

    const AndroidInitializationSettings initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const initSettingsIOS = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    const initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
    );

    await notificationPlugin.initialize(
      initSettings,
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
  }) {
    return notificationPlugin.show(id, title, body, notificationDetails());
  }
}
