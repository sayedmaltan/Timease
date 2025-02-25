import 'package:dartz/dartz.dart';
import 'package:timease_mobile/core/errors/failure.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';

abstract class EventRepo {
  Future<Either<Failure, List<EventModel>>> getUserEvents({
    required String userId,
  });

  // Future<Either<Failure, List<EventModel>>> createEvent({
  //   required String userId,
  // });
}
