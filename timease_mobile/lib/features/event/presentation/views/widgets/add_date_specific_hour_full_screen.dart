import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AddDateSpecificHourFullScreen extends StatefulWidget {
  const AddDateSpecificHourFullScreen({super.key});

  @override
  State<AddDateSpecificHourFullScreen> createState() =>
      _AddDateSpecificHourFullScreenState();
}

class _AddDateSpecificHourFullScreenState
    extends State<AddDateSpecificHourFullScreen> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.now(),
              lastDay: DateTime.utc(
                DateTime.now().year + 1,
                DateTime.now().month,
                DateTime.now().day,
              ),
              focusedDay: focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(this.selectedDay, selectedDay)) {
                  setState(() {
                    this.selectedDay = selectedDay;
                    this.focusedDay = focusedDay;
                  });
                }
              },
              calendarFormat: calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                this.focusedDay = focusedDay;
              },
            ),
          ],
        ),
      ),
    );
  }
}
