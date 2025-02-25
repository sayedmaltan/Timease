
import '../../../data/models/event_model.dart';

abstract class UserEventsState{}

class UserEventInitial extends UserEventsState{}

class UserEventsLoading extends UserEventsState{}

class UserEventsSuccess extends UserEventsState{
  List<EventModel> eventsListModel;
  UserEventsSuccess({required this.eventsListModel});
}

class UserEventsFailure extends UserEventsState{
  final String errMessage;
  UserEventsFailure({required this.errMessage});
}

