import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/create_meeting_cubit/create_meeting_cubit.dart';
import '../../../../../constants.dart';
import '../../../../event/data/models/event_model.dart';

class CustomMeetingTableCalender extends StatelessWidget {
  const CustomMeetingTableCalender({
    super.key,
    required this.eventModel,
    required this.createMeetingCubit,
  });

  final EventModel eventModel;
  final CreateMeetingCubit createMeetingCubit;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.now(),
      lastDay: eventModel.isPeriodic!
          ? DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day +
            eventModel.schedulingRange!.toInt(),
      )
          : createMeetingCubit.getLastDate(eventModel: eventModel),
      focusedDay: createMeetingCubit.focusedDay,
      selectedDayPredicate: (day) {
        if(createMeetingCubit.selectedDay == null) {
          return false;
        }
        return isSameDay(createMeetingCubit.selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) => createMeetingCubit.onDaySelected(selectedDay, focusedDay, eventModel),
      calendarFormat: createMeetingCubit.calendarFormat,
      onFormatChanged: (format) => createMeetingCubit.onFormatChanged(format),
      onPageChanged: createMeetingCubit.onPageChanged,
      calendarStyle: CalendarStyle(
        weekendTextStyle: TextStyle(color: Colors.black),
        selectedDecoration: BoxDecoration(
          color: kPrimaryColor,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: kPrimaryColor.shade200,
          shape: BoxShape.circle,
        ),
        tableBorder: TableBorder(
          bottom: BorderSide(color: kPrimaryColor, width: 1.5),
        ),
      ),
      enabledDayPredicate: (date) {
        return createMeetingCubit.isAllowedDay(
            date: date, eventModel: eventModel);
      },
      daysOfWeekHeight: 40,
      rowHeight: 60,
    );
  }
}