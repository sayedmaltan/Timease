import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timease_mobile/features/meeting/data/repos/meeting_repo.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/meeting_cubit/meeting_state.dart';

import '../../../data/models/get_user_meetings_model.dart';

class MeetingCubit extends Cubit<MeetingStates> {
  MeetingCubit(this.meetingRepo) : super(MeetingInitialState());
  final MeetingRepo meetingRepo;
  DateTime? selectedDay;
  String? availabilityId;
  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.week;
  List<String> availableTimeList = [];
  TextEditingController meetingController = TextEditingController();
  List<Meetings> originalMeetings = [];




  static MeetingCubit get(context) {
    return BlocProvider.of(context);
  }


  Future<void> getUserMeetingsList() async {
    emit(GetUserMeetingsLoadingState());
    var response = await meetingRepo.getUserMeetings();
    response.fold(
      (failure) {
        emit(GetUserMeetingsFailureState(failure.errMessage));
      },
      (userMeetingsList) {
        emit(GetUserMeetingsSuccessState(userMeetingsList));
      },
    );
  }

  Future<void> deleteUserMeetingItem({
    required String meetingId,
  }) async {
    emit(DeleteUserMeetingLoading());
    var response =
        await meetingRepo.deleteUserMeetingItem(meetingId: meetingId);
    response.fold(
      (failure) {
        emit(DeleteUserMeetingFailure(errMessage: failure.errMessage));
      },
      (deleted) {
        emit(DeleteUserMeetingSuccess(isDeleted: deleted));
      },
    );
  }

  void searchMeetings({
    required List<Meetings> meetings,
  }) {
    if (meetingController.text.isEmpty) {
      emit(GetUserMeetingsSuccessState(
        GetUserMeetingsModel(meetingsNo: meetings.length, meetings: meetings),
      ));
    } else {
      List<Meetings> myList = [];
      for (int i = 0; i < meetings.length; i++) {
        var attendee = meetings[i].attendees;
        for (int j = 0; j < attendee!.length; j++) {
          String name = '${attendee[j].firstName} ${attendee[j].lastName}';
          if (name.toLowerCase().contains(meetingController.text.toLowerCase())) {
            myList.add(meetings[i]);
          }
        }
      }
      emit(SearchMeetingState(meetings: myList));
    }
  }
}
