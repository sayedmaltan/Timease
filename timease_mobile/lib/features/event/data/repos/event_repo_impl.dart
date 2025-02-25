import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:timease_mobile/core/errors/failure.dart';
import 'package:timease_mobile/core/utils/api_service.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import 'package:timease_mobile/features/event/data/repos/event_repo.dart';

class EventRepoImpl implements EventRepo {
  ApiService apiService;

  EventRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<EventModel>>> getUserEvents(
      {required String userId}) async {
    try {
      var json = await apiService.get(
        endPoint: 'event/user/$userId',
      );
      List<EventModel> userEventsList = [];
      for (var element in json['events']) {
        userEventsList.add(EventModel.fromJson(element));
      }
      return right(userEventsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(dioError: e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
