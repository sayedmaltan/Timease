
import 'package:dartz/dartz.dart';
import 'package:timease_mobile/features/notification/data/models/notifications_model.dart';
import '../../../../core/errors/failure.dart';

abstract class NotificationsRepo {
  Future<Either<Failure, NotificationsModel>> getUnSentNotifications({required String userId});
  Future<Either<Failure, bool>> sendBroadcast({required String eventId,required String title,required String message});

}
