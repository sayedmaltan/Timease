import 'package:timease_mobile/features/meeting/data/models/check_fully_booked_model.dart';
import 'package:timease_mobile/features/meeting/data/models/get_user_meetings_model.dart';

abstract class MeetingStates{
}

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

class GetUserMeetingsLoadingState extends MeetingStates{}

class GetUserMeetingsSuccessState extends MeetingStates{
  final GetUserMeetingsModel getUserMeetingsModel;

  GetUserMeetingsSuccessState(this.getUserMeetingsModel);
}

class GetUserMeetingsFailureState extends MeetingStates{
  GetUserMeetingsFailureState(this.errMessage);
  final String errMessage;
}

class DeleteUserMeetingLoading extends MeetingStates {}

class DeleteUserMeetingSuccess extends MeetingStates {
  final bool isDeleted;

  DeleteUserMeetingSuccess({required this.isDeleted});
}

class DeleteUserMeetingFailure extends MeetingStates {
  final String errMessage;

  DeleteUserMeetingFailure({required this.errMessage});
}