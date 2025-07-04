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
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.black12,
                radius: 20,
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Timease',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 29,
                fontWeight: FontWeight.w700,
                fontFamily: "jannah",
              ),
            ),
          ],
        ),
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
              meetingTitle: selectedMeetings[index].title!,
              meetingModel: selectedMeetings[index],
            ),
          ),
        ),
      ],
    );
  }
}
