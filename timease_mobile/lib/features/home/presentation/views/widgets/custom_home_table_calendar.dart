import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/features/meeting/data/models/get_user_meetings_model.dart';

import '../../../../../core/utils/function/counts_meetings_per_day.dart';

class CustomHomeTableCalendar extends StatelessWidget {
  const CustomHomeTableCalendar({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    required this.onDaySelected,
    required this.calendarFormat,
    required this.onFormatChanged,
    required this.calendarBuilders,
    required this.onPageChanged,
    required this.meetings,
  });

  final DateTime focusedDay;
  final DateTime selectedDay;
  final OnDaySelected onDaySelected;
  final CalendarFormat calendarFormat;
  final void Function(CalendarFormat) onFormatChanged;
  final CalendarBuilders calendarBuilders;
  final void Function(DateTime) onPageChanged;
  final List<Meetings> meetings;

  @override
  Widget build(BuildContext context) {
    DateTime day = DateTime.now();
    String dayKey =
        "${day.year}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}";
    int meetingsCount = countMeetingsPerDay(meetings)[dayKey] ?? 0;
    Color bgColor;
    if (meetingsCount == 0) {
      bgColor = Colors.white;
    } else if (meetingsCount == 1) {
      bgColor = kPrimaryColor.shade100;
    } else if (meetingsCount == 2) {
      bgColor = kPrimaryColor.shade200;
    } else if (meetingsCount == 3) {
      bgColor = kPrimaryColor.shade300;
    } else if (meetingsCount == 4) {
      bgColor = kPrimaryColor.shade400;
    } else if (meetingsCount == 5) {
      bgColor = kPrimaryColor.shade500;
    } else if (meetingsCount == 6) {
      bgColor = kPrimaryColor.shade600;
    } else if (meetingsCount == 7) {
      bgColor = kPrimaryColor.shade700;
    } else if (meetingsCount == 8) {
      bgColor = kPrimaryColor.shade800;
    } else {
      bgColor = kPrimaryColor.shade900;
    }
    return TableCalendar(
      firstDay: DateTime.utc(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day),
      lastDay: DateTime.utc(
          DateTime.now().year + 1, DateTime.now().month, DateTime.now().day),
      focusedDay: focusedDay,
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      onDaySelected: onDaySelected,
      calendarFormat: calendarFormat,
      onFormatChanged: onFormatChanged,
      calendarBuilders: calendarBuilders,
      calendarStyle: CalendarStyle(
        weekendTextStyle: TextStyle(color: Colors.black),
        selectedDecoration: BoxDecoration(
          color: kPrimaryColor,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        tableBorder: TableBorder(
          bottom: BorderSide(color: kPrimaryColor.shade100, width: 1),
        ),
      ),
      onPageChanged: onPageChanged,
      rowHeight: 70,
      daysOfWeekHeight: 40,
    );
  }
}
