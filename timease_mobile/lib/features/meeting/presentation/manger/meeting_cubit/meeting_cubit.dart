import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/meeting_cubit/meeting_state.dart';

class MeetingCubit extends Cubit<MeetingStates> {
  MeetingCubit() : super(MeetingInitialState());

  DateTime? selectedDay;
  String ?availabilityId;
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

  List<String> getAvailableTimeList(
      {required EventModel eventModel, DateTime? selectedDate}) {
    if (!eventModel.isPeriodic! && selectedDate != null) {
      for (var element in eventModel.availabilities!) {
        if (DateFormat('yyyy-MM-dd').format(selectedDate) ==
            DateFormat('yyyy-MM-dd').format(DateTime.parse(element.date!))) {
          DateTime startDateTime =
              DateTime.parse("${element.date} ${element.startTime}");
          DateTime endDateTime =
              DateTime.parse("${element.date} ${element.endTime}");
          availabilityId=element.id;
          DateTime current = startDateTime;
          DateFormat formatter = DateFormat('hh:mm a');
          while (current.isBefore(endDateTime)) {
            availableTimeList.add(formatter.format(current));
            current = current.add(Duration(minutes: eventModel.duration!));
          }
        }
      }
    } else if (eventModel.isPeriodic! && selectedDate != null) {
      String dayOfWeak = DateFormat('EEEE').format(selectedDate).toUpperCase();
      for (var element in eventModel.availabilities!) {
        if (dayOfWeak == element.dayOfWeek) {
          DateTime startDateTime =
              DateTime.parse("2001-01-01 ${element.startTime}");
          DateTime endDateTime =
              DateTime.parse("2001-01-01 ${element.endTime}");
          availabilityId=element.id;
          DateTime current = startDateTime;
          DateFormat formatter = DateFormat('hh:mm a');
          while (current.isBefore(endDateTime)) {
            availableTimeList.add(formatter.format(current));
            current = current.add(Duration(minutes: eventModel.duration!));
          }
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
      getAvailableTimeList(eventModel: eventModel, selectedDate: selectedDay);
      emit(MeetingChangeCalenderState());
    }
  }

  void onFormatChanged(format) {
    calendarFormat = format;
    emit(MeetingChangeCalenderState());
  }

  void onPageChanged(focusedDay) {
    this.focusedDay = focusedDay;
  }
}
