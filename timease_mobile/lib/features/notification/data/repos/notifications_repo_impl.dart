import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/api_service.dart';
import '../models/notifications_model.dart';
import 'notifications_repo.dart';

class NotificationsRepoImpl implements NotificationsRepo {
  ApiService apiService;

  NotificationsRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, NotificationsModel>> getUnSentNotifications(
      {required String userId}) async {
    try {
      var json = await apiService.get(
        endPoint: 'notifications/user/$userId',
      );
      NotificationsModel unSentNotifications =
          NotificationsModel.fromJson(json);

      return right(unSentNotifications);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(dioError: e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> sendBroadcast(
      {required String eventId,
      required String title,
      required String message}) async {
    try {
      var json = await apiService.post(
        endPoint: 'notifications/broadcast',
        body: {
          "eventId": eventId,
          "title": title,
          "message": message
        },
      );
      return right(json as bool);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(dioError: e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
