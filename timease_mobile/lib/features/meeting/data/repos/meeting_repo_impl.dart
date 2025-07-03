import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:timease_mobile/core/errors/failure.dart';
import 'package:timease_mobile/core/utils/api_service.dart';
import 'package:timease_mobile/features/meeting/data/models/check_fully_booked_model.dart';
import 'package:timease_mobile/features/meeting/data/models/get_user_meetings_model.dart';
import '../../presentation/manger/create_meeting_cubit/create_meeting_state.dart';
import 'meeting_repo.dart';

class MeetingRepoImpl implements MeetingRepo {
  ApiService apiService;

  MeetingRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, CreateMeetingSuccessState>> createMeeting(
      {required String availabilityId,
      required String date,
      required String startTime,
      required String endTime}) async {
    try {
      await apiService.post(
        endPoint: 'meeting',
        body: {
          "availabilityId": availabilityId,
          "date": date,
          "startTime": startTime,
          "endTime": endTime
        },
      );
      return right(CreateMeetingSuccessState());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(dioError: e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CheckFullyBookedModel>> checkFullyBooked(
      {required String availabilityId, required String date}) async {
    try {
      var json = await apiService.get(
        endPoint:
            'meeting/fullMeeting?availabilityId=$availabilityId&date=$date',
      );
      return right(CheckFullyBookedModel.fromJson(json));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(dioError: e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetUserMeetingsModel>> getUserMeetings() async {
    try {
      var json = await apiService.get(
        endPoint: 'meeting/userMeetings',
      );
      List ids = [];
      for (int i = 0; i < json['meetings'].length; i++) {
        ids.add(json['meetings'][i]['id']);
      }
      var json2 = await apiService.get(
        endPoint: 'meeting/meetingTitles',
        body: {
          "list": ids,
        },
      );
      int counter = 0;
      json2.forEach(
        (key, value) {
          json['meetings'][counter++]['title'] = value;
        },
      );
      return right(GetUserMeetingsModel.fromJson(json));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(dioError: e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUserMeetingItem(
      {required String meetingId}) async {
    try {
      await apiService.delete(
        endPoint: 'meeting?meetingId=$meetingId',
      );
      return right(true);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(dioError: e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
