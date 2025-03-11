import 'package:dartz/dartz.dart';
import 'package:timease_mobile/core/errors/failure.dart';
import 'package:timease_mobile/features/event/data/models/create_event_model.dart';
import 'package:timease_mobile/features/event/data/models/create_event_response.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';

abstract class EventRepo {
  Future<Either<Failure, List<EventModel>>> getUserEvents();
  Future<Either<Failure, bool>> deleteUserEventsItem({required String eventId});


  Future<Either<Failure, CreateEventResponseModel>> createEvent({
    required CreateEventModel createEventModel,
  });
}
