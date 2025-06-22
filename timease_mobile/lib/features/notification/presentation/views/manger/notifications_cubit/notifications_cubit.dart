import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timease_mobile/core/utils/cash_helper.dart';
import 'package:timease_mobile/features/notification/data/repos/notifications_repo.dart';

import '../../../../data/models/notifications_model.dart';
import 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this.notificationsRepo)
      : super(GetUnSentNotificationsInitial());
  final NotificationsRepo notificationsRepo;

  static NotificationsCubit get(context) {
    return BlocProvider.of(context);
  }

  Future<void> getUnSentNotifications({
    required String userId,
    required bool isTimer
  }) async {
    emit(GetUnSentNotificationsLoading(isTimer: isTimer));
    var response =
        await notificationsRepo.getUnSentNotifications(userId: userId);
    response.fold(
      (failure) {
        emit(GetUnSentNotificationsFailure(errMessage: failure.errMessage));
      },
      (notifications) async {
        List<Notifications> cashedNotifications =
            await loadCashedNotifications();
        List<Notifications> unSentNotifications =
            notifications.notifications ?? [];
        unSentNotifications.addAll(cashedNotifications);
          while (unSentNotifications.length > 10) {
            unSentNotifications.removeAt(unSentNotifications.length-1);
          }
        saveCashedNotifications(unSentNotifications: unSentNotifications);
        emit(GetUnSentNotificationsSuccess(notificationsList: unSentNotifications));
      },
    );
  }

  Future<List<Notifications>> loadCashedNotifications() async {
    final String? encodedData = CashHelper.getData('notifications');
    if (encodedData != null) {
      final List decodedList = jsonDecode(encodedData);
      return decodedList.map((json) => Notifications.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  void saveCashedNotifications(
      {required List<Notifications> unSentNotifications}) async {
    final String encodedData =
        jsonEncode(unSentNotifications.map((u) => u.toJson()).toList());
    await CashHelper.setData('notifications', encodedData);
  }
}
