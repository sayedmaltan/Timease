import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/meeting_cubit/meeting_state.dart';

class MeetingCubit extends Cubit<MeetingStates> {
  MeetingCubit() : super(MeetingInitialState());

  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.week;



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
      return allowedDates.any((element) => element.compareTo(DateFormat('yyyy-MM-dd').format(date))==0);
    }
  }

  DateTime getLastDate({ required EventModel eventModel}){
    DateTime lastDate=DateTime(2024,04,01);
    for (var element in eventModel.availabilities!) {
      if(DateTime.parse(element.date!).isAfter(lastDate))
        {
          lastDate=DateTime.parse(element.date!);
        }
    }
    return lastDate;
  }

  static MeetingCubit get(context) {
    return BlocProvider.of(context);
  }

  void onDaySelected(selectedDay, focusedDay) {
    if (!isSameDay(this.selectedDay, selectedDay)) {
      this.selectedDay = selectedDay;
      this.focusedDay = focusedDay;
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
