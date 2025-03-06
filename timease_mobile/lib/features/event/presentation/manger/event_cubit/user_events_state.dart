import '../../../data/models/event_model.dart';

abstract class UserEventsState {}

class UserEventInitial extends UserEventsState {}

class GetUserEventsLoading extends UserEventsState {}

class GetUserEventsSuccess extends UserEventsState {
  List<EventModel> eventsListModel;

  GetUserEventsSuccess({required this.eventsListModel});
}

class GetUserEventsFailure extends UserEventsState {
  final String errMessage;

  GetUserEventsFailure({required this.errMessage});
}

class SearchEventsLoading extends UserEventsState {}

class SearchEventsSuccess extends UserEventsState {
  List<EventModel> eventsListModel;

  SearchEventsSuccess({required this.eventsListModel});
}

class DeleteUserEventsLoading extends UserEventsState {}

class DeleteUserEventsSuccess extends UserEventsState {
  final bool isDeleted;

  DeleteUserEventsSuccess({required this.isDeleted});
}

class DeleteUserEventsFailure extends UserEventsState {
  final String errMessage;

  DeleteUserEventsFailure({required this.errMessage});
}