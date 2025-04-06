import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../constants.dart';
import '../../../../event/data/models/event_model.dart';
import '../../manger/meeting_cubit/meeting_cubit.dart';

class CustomMeetingTableCalender extends StatelessWidget {
  const CustomMeetingTableCalender({
    super.key,
    required this.eventModel,
    required this.meetingCubit,
  });

  final EventModel eventModel;
  final MeetingCubit meetingCubit;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.now(),
      lastDay: eventModel.schedulingRange != 0
          ? DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day +
            eventModel.schedulingRange!.toInt(),
      )
          : meetingCubit.getLastDate(eventModel: eventModel),
      focusedDay: meetingCubit.focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(meetingCubit.selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) => meetingCubit.onDaySelected(selectedDay, focusedDay, eventModel),
      calendarFormat: meetingCubit.calendarFormat,
      onFormatChanged: (format) => meetingCubit.onFormatChanged(format),
      onPageChanged: meetingCubit.onPageChanged,
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
        return meetingCubit.isAllowedDay(
            date: date, eventModel: eventModel);
      },
      daysOfWeekHeight: 40,
      rowHeight: 60,
    );
  }
}
