import 'package:timease_mobile/features/meeting/data/models/check_fully_booked_model.dart';

abstract class MeetingStates{}

class MeetingInitialState extends MeetingStates{}

class MeetingChangeCalenderState extends MeetingStates{}

class CreateMeetingLoadingState extends MeetingStates{}

class CreateMeetingSuccessState extends MeetingStates{}

class CreateMeetingFailureState extends MeetingStates{
  CreateMeetingFailureState(this.errMessage);
  final String errMessage;
}

class CheckFullyBookedLoadingState extends MeetingStates{}

class CheckFullyBookedSuccessState extends MeetingStates{
  final CheckFullyBookedModel checkFullyBookedModel;

  CheckFullyBookedSuccessState(this.checkFullyBookedModel);
}

class CheckFullyBookedFailureState extends MeetingStates{
  CheckFullyBookedFailureState(this.errMessage);
  final String errMessage;
}



