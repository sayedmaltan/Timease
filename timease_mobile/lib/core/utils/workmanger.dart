import 'dart:async';

import 'package:flutter/cupertino.dart';
import '../../features/notification/presentation/views/manger/notifications_cubit/notifications_cubit.dart';
import 'cash_helper.dart';

// const taskName = "myPeriodicTask";
//
// @pragma('vm:entry-point')
// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     print("Background task running: $task");
//     NotificationsCubit notificationsCubit =
//         NotificationsCubit(getIt.get<NotificationsRepoImpl>());
//     notificationsCubit.getUnSentNotifications(
//       userId: CashHelper.getData('userId'),
//     );
//     return Future.value(true);
//   });
// }
//
// void setupWorkManger() {
//   Workmanager().initialize(
//     callbackDispatcher,
//     isInDebugMode: true,
//   );
//
//   Workmanager().registerPeriodicTask(
//     "uniqueTaskName",
//     taskName,
//     frequency: const Duration(minutes: 2), // min is 15 on Android
//     existingWorkPolicy: ExistingWorkPolicy.keep,
//   );
// }

class BackgroundTaskService {
  static final BackgroundTaskService _instance = BackgroundTaskService._internal();
  factory BackgroundTaskService() => _instance;

  BackgroundTaskService._internal();

  Timer? _timer;

  void start({required BuildContext context}) {
    _timer ??= Timer.periodic(Duration(minutes: 5), (timer) {
      NotificationsCubit notificationsCubit =
        NotificationsCubit.get(context);
    notificationsCubit.getUnSentNotifications(
      userId: CashHelper.getData('userId'),
      isTimer: true
    );
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }
}