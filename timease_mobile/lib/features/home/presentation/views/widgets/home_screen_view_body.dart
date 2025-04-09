import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timease_mobile/features/meeting/presentation/views/widgets/try_book_meeting_view.dart';

class HomeScreenViewBody extends StatefulWidget {
  const HomeScreenViewBody({super.key});

  @override
  State<HomeScreenViewBody> createState() => _HomeScreenViewBodyState();
}

class _HomeScreenViewBodyState extends State<HomeScreenViewBody> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        TryBookMeetingView(controller: TextEditingController()),
      ],
    );
  }
}
