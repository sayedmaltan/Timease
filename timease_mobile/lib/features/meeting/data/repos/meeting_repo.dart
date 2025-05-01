import 'package:dartz/dartz.dart' ;
import 'package:timease_mobile/core/errors/failure.dart';
import 'package:timease_mobile/features/meeting/data/models/check_fully_booked_model.dart';
import 'package:timease_mobile/features/meeting/data/models/get_user_meetings_model.dart';

import '../../presentation/manger/create_meeting_cubit/create_meeting_state.dart';

abstract class MeetingRepo {

  Future<Either<Failure, CreateMeetingSuccessState>> createMeeting({
    required String availabilityId,
    required String date,
    required String startTime,
    required String endTime,

  });

  Future<Either<Failure, CheckFullyBookedModel>> checkFullyBooked({
    required String availabilityId,
    required String date,
  });

  Future<Either<Failure, GetUserMeetingsModel>> getUserMeetings();

  Future<Either<Failure, bool>> deleteUserMeetingItem({required String meetingId});

}
