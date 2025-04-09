import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timease_mobile/core/utils/dates_converter.dart';
import 'package:timease_mobile/core/utils/function/doesNotContainStartTime.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import 'package:timease_mobile/features/meeting/data/models/check_fully_booked_model.dart';
import 'package:timease_mobile/features/meeting/data/repos/meeting_repo.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/meeting_cubit/meeting_state.dart';

class MeetingCubit extends Cubit<MeetingStates> {
  MeetingCubit(this.meetingRepo) : super(MeetingInitialState());
  final MeetingRepo meetingRepo;
  DateTime? selectedDay;
  String? availabilityId;
  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.week;
  List<String> availableTimeList = [];

  bool isAllowedDay({required DateTime date, required EventModel eventModel}) {
    List<String> allowedDayOfWeek = [];
    if (eventModel.isPeriodic!) {
      for (var element in eventModel.availabilities!) {
        allowedDayOfWeek.add(element.dayOfWeek!);
      }
      return allowedDayOfWeek.any(
        (element) =>
            element.compareTo(DateFormat('EEEE').format(date).toUpperCase()) ==
            0,
      );
    } else {
      List<String> allowedDates = [];
      for (var element in eventModel.availabilities!) {
        allowedDates.add(element.date!);
      }
      return allowedDates.any((element) =>
          element.compareTo(DateFormat('yyyy-MM-dd').format(date)) == 0);
    }
  }

  bool isTodaySelected({required eventModel}) {
    if (isAllowedDay(date: DateTime.now(), eventModel: eventModel)) {
      selectedDay = DateTime.now();
      return true;
    }
    return false;
  }

  List<String> getAvailableTimeList({required EventModel eventModel, DateTime? selectedDate})
  {
    if (!eventModel.isPeriodic! && selectedDate != null) {
      for (var element in eventModel.availabilities!) {
        if (DateFormat('yyyy-MM-dd').format(selectedDate) ==
            DateFormat('yyyy-MM-dd').format(DateTime.parse(element.date!))) {
          DateTime startDateTime =
              DateTime.parse("${element.date} ${element.startTime}");
          DateTime endDateTime =
              DateTime.parse("${element.date} ${element.endTime}");
          availabilityId = element.id;
          checkFullyBooked(availabilityId: availabilityId!, date: DateFormat('yyyy-MM-dd').format(selectedDate))
              .then(
            (value) {
              availableTimeList=[];
              CheckFullyBookedModel? fullyBooked = value;
              DateTime current = startDateTime;
              DateFormat formatter = DateFormat('hh:mm a');
              while (current.isBefore(endDateTime)) {
                String time12hr = formatter.format(current);
                String time24hr=DatesConverter.convert12hrTo24(time12Hr: time12hr);
                if (doesNotContainStartTime(fullyBooked!, time24hr)) {
                  availableTimeList.add(time12hr);
                }
                current = current.add(Duration(minutes: eventModel.duration!));
              }
            },
          );

        }
      }
    }
    else if (eventModel.isPeriodic! && selectedDate != null) {
      String dayOfWeak = DateFormat('EEEE').format(selectedDate).toUpperCase();
      for (var element in eventModel.availabilities!) {
        if (dayOfWeak == element.dayOfWeek) {
          DateTime startDateTime =
              DateTime.parse("2001-01-01 ${element.startTime}");
          DateTime endDateTime =
              DateTime.parse("2001-01-01 ${element.endTime}");
          availabilityId = element.id;
            checkFullyBooked(
              availabilityId: availabilityId!, date: DateFormat('yyyy-MM-dd').format(selectedDate)).then((value) {
              CheckFullyBookedModel ?fullyBooked =value;
              DateTime current = startDateTime;
              DateFormat formatter = DateFormat('hh:mm a');
              availableTimeList=[];
              while (current.isBefore(endDateTime)) {
                String time12hr = formatter.format(current);
                String time24hr=DatesConverter.convert12hrTo24(time12Hr: time12hr);
                if (doesNotContainStartTime(fullyBooked!, time24hr)) {
                  availableTimeList.add(time12hr);
                }

                current = current.add(Duration(minutes: eventModel.duration!));
              }
              },);

          return availableTimeList;
        }
      }
    }
    return availableTimeList;
  }

  DateTime getLastDate({required EventModel eventModel}) {
    DateTime lastDate = DateTime(2024, 04, 01);
    for (var element in eventModel.availabilities!) {
      if (DateTime.parse(element.date!).isAfter(lastDate)) {
        lastDate = DateTime.parse(element.date!);
      }
    }
    return lastDate;
  }

  static MeetingCubit get(context) {
    return BlocProvider.of(context);
  }

  void onDaySelected(selectedDay, focusedDay, eventModel) {
    if (!isSameDay(this.selectedDay, selectedDay)) {
      this.selectedDay = selectedDay;
      this.focusedDay = focusedDay;
      availableTimeList = [];
      emit(MeetingChangeCalenderState());
      getAvailableTimeList(eventModel: eventModel, selectedDate: selectedDay);
    }
  }

  void onFormatChanged(format) {
    calendarFormat = format;
    emit(MeetingChangeCalenderState());
  }

  void onPageChanged(focusedDay) {
    this.focusedDay = focusedDay;
  }

  Future<void> createMeeting({
    required String availabilityId,
    required String date,
    required String startTime,
    required String endTime,
  }) async
  {
    emit(CreateMeetingLoadingState());
    var response = await meetingRepo.createMeeting(
      availabilityId: availabilityId,
      date: date,
      startTime: startTime,
      endTime: endTime,
    );
    response.fold(
      (failure) {
        emit(CreateMeetingFailureState(failure.errMessage));
      },
      (success) {
        emit(CreateMeetingSuccessState());
      },
    );
  }

  Future<CheckFullyBookedModel?> checkFullyBooked({
    required String availabilityId,
    required String date,
  }) async
  {
    emit(CheckFullyBookedLoadingState());
    var response = await meetingRepo.checkFullyBooked(
      availabilityId: availabilityId,
      date: date,
    );

    CheckFullyBookedModel? result;

    response.fold(
          (failure) {
        emit(CheckFullyBookedFailureState(failure.errMessage));
      },
          (CheckFullyBookedModel checkFullyBookedModel) {
        emit(CheckFullyBookedSuccessState(checkFullyBookedModel));
        result = checkFullyBookedModel;
      },
    );

    return result;
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
  }) async
  {
    emit(DeleteUserMeetingLoading());
    var response = await meetingRepo.deleteUserMeetingItem(meetingId: meetingId);
    response.fold(
          (failure)   {
        emit(DeleteUserMeetingFailure(errMessage: failure.errMessage));
      },
          (deleted) {
        emit(DeleteUserMeetingSuccess(isDeleted: deleted));
      },
    );
  }

}
