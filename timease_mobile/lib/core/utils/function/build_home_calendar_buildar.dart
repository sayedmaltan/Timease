import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timease_mobile/constants.dart';
import '../../../features/meeting/data/models/get_user_meetings_model.dart';
import 'counts_meetings_per_day.dart';

CalendarBuilders<dynamic> buildHomeCalendarBuilders(List<Meetings> meetings) {
  return CalendarBuilders(
    defaultBuilder: (context, day, focusedDay) {
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

      return Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          '${day.day}',
          style: TextStyle(
            color: meetingsCount > 0 ? Colors.white : Colors.black87,
          ),
        ),
      );
    },
    todayBuilder: (context, day, focusedDay) {
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

      return Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          '${day.day}',
          style: TextStyle(
            color: meetingsCount > 0 ? Colors.white : Colors.black87,
          ),
        ),
      );
    },
  );
}
