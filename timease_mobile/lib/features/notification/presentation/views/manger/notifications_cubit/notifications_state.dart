
import 'package:timease_mobile/features/notification/data/models/notifications_model.dart';

abstract class NotificationsState {}

class GetUnSentNotificationsInitial extends NotificationsState {}

class GetUnSentNotificationsLoading extends NotificationsState {}

class GetUnSentNotificationsSuccess extends NotificationsState {
  List<Notifications> notificationsList;
  GetUnSentNotificationsSuccess({required this.notificationsList});
}

class GetUnSentNotificationsFailure extends NotificationsState {
  final String errMessage;

  GetUnSentNotificationsFailure({required this.errMessage});
}