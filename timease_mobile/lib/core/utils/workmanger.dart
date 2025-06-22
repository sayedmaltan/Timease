import 'package:timease_mobile/core/utils/service_locator.dart';
import 'package:timease_mobile/features/notification/data/repos/notifications_repo_impl.dart';
import 'package:workmanager/workmanager.dart';
import '../../features/notification/presentation/views/manger/notifications_cubit/notifications_cubit.dart';
import 'cash_helper.dart';
const taskName = "myPeriodicTask";

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    print("Background task running: $task");
    NotificationsCubit notificationsCubit =
        NotificationsCubit(getIt.get<NotificationsRepoImpl>());
    notificationsCubit.getUnSentNotifications(
      userId: CashHelper.getData('userId'),
    );
    return Future.value(true);
  });
}

void setupWorkManger() {
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );

  Workmanager().registerPeriodicTask(
    "uniqueTaskName",
    taskName,
    frequency: const Duration(minutes: 2), // min is 15 on Android
    existingWorkPolicy: ExistingWorkPolicy.keep,
  );
}