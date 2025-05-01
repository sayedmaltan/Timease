import '../../../data/models/event_model.dart';

abstract class OneEventsState {}

class GetOneEventInitial extends OneEventsState {}

class GetOneEventLoading extends OneEventsState {}

class GetOneEventSuccess extends OneEventsState {
  EventModel eventModel;
  GetOneEventSuccess({required this.eventModel});
}

class GetOneEventFailure extends OneEventsState {
  final String errMessage;

  GetOneEventFailure({required this.errMessage});
}