import 'package:dartz/dartz.dart' ;
import 'package:timease_mobile/core/errors/failure.dart';
import 'package:timease_mobile/features/meeting/data/models/check_fully_booked_model.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/meeting_cubit/meeting_state.dart';

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
}
