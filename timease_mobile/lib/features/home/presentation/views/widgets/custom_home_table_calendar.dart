import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomHomeTableCalendar extends StatelessWidget {
  const CustomHomeTableCalendar({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    required this.onDaySelected,
    required this.calendarFormat,
    required this.onFormatChanged,
  });

  final DateTime focusedDay;
  final DateTime selectedDay;
  final OnDaySelected onDaySelected;
  final CalendarFormat calendarFormat;
  final void Function(CalendarFormat) onFormatChanged;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: focusedDay,
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      onDaySelected: onDaySelected,
      calendarFormat: calendarFormat,
      onFormatChanged: onFormatChanged,
    );
  }
}
