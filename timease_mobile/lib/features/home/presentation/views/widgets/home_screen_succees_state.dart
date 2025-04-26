import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../meeting/data/models/get_user_meetings_model.dart';
import '../../../../meeting/presentation/views/widgets/custom_meeting_box.dart';
import 'custom_home_table_calendar.dart';

class HomeScreenSuccessState extends StatelessWidget {
  const HomeScreenSuccessState({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    required this.onDaySelected,
    required this.calendarFormat,
    required this.onFormatChanged,
    required this.calendarBuilders,
    required this.onPageChanged,
    required this.selectedMeetings,
    required this.meetings,
  });

  final DateTime focusedDay;
  final DateTime selectedDay;
  final OnDaySelected onDaySelected;
  final CalendarFormat calendarFormat;
  final void Function(CalendarFormat) onFormatChanged;
  final CalendarBuilders calendarBuilders;
  final void Function(DateTime) onPageChanged;
  final List<Meetings> selectedMeetings;
  final List<Meetings> meetings;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHomeTableCalendar(
          focusedDay: focusedDay,
          selectedDay: selectedDay,
          onDaySelected: onDaySelected,
          calendarFormat: calendarFormat,
          onFormatChanged: onFormatChanged,
          calendarBuilders: calendarBuilders,
          onPageChanged: onPageChanged,
          meetings: selectedMeetings,
        ),
        SizedBox(
          height: 4,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: selectedMeetings.length,
            itemBuilder: (context, index) => CustomMeetingBox(
              meetingId: selectedMeetings[index].id!,
              meetingModel: selectedMeetings[index],
            ),
          ),
        ),
      ],
    );
  }
}
