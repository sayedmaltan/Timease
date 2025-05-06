import 'package:timease_mobile/features/meeting/data/models/get_user_meetings_model.dart';

abstract class MeetingStates {}

class MeetingInitialState extends MeetingStates {}


class GetUserMeetingsLoadingState extends MeetingStates {}

class GetUserMeetingsSuccessState extends MeetingStates {
  final GetUserMeetingsModel getUserMeetingsModel;

  GetUserMeetingsSuccessState(this.getUserMeetingsModel);
}

class GetUserMeetingsFailureState extends MeetingStates {
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

class SearchMeetingState extends MeetingStates {
  final List<Meetings> meetings;

  SearchMeetingState({required this.meetings});
}
