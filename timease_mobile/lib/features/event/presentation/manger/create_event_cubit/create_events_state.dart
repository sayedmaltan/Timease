import 'package:timease_mobile/features/event/data/models/create_event_response.dart';


abstract class CreateEventsState {}

class CreateEventInitial extends CreateEventsState {}

class CreateEventsLoading extends CreateEventsState {}

class CreateEventsSuccess extends CreateEventsState {
  CreateEventResponseModel createEventResponseModel;

  CreateEventsSuccess({required this.createEventResponseModel});
}

class CreateEventsFailure extends CreateEventsState {
  final String errMessage;

  CreateEventsFailure({required this.errMessage});
}


