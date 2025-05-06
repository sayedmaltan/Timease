import '../../../data/models/check_fully_booked_model.dart';

abstract class CreateMeetingState {}

class CreateMeetingInitialState extends CreateMeetingState {}

class MeetingChangeCalenderState extends CreateMeetingState {}

class CreateMeetingLoadingState extends CreateMeetingState {}

class CreateMeetingSuccessState extends CreateMeetingState {}

class CreateMeetingFailureState extends CreateMeetingState {
  CreateMeetingFailureState(this.errMessage);

  final String errMessage;
}

class CheckFullyBookedLoadingState extends CreateMeetingState {}

class CheckFullyBookedSuccessState extends CreateMeetingState {
  final CheckFullyBookedModel checkFullyBookedModel;

  CheckFullyBookedSuccessState(this.checkFullyBookedModel);
}

class CheckFullyBookedFailureState extends CreateMeetingState {
  CheckFullyBookedFailureState(this.errMessage);

  final String errMessage;
}
