abstract class MeetingStates{}

class MeetingInitialState extends MeetingStates{}

class MeetingLoadingState extends MeetingStates{}

class MeetingSuccessState extends MeetingStates{}

class MeetingFailureState extends MeetingStates{
  MeetingFailureState(this.errMessage);
  final String errMessage;
}

class MeetingChangeCalenderState extends MeetingStates{}


