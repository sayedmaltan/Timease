import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/meeting_cubit/meeting_cubit.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/meeting_cubit/meeting_state.dart';

class CreateMeetingViewBody extends StatelessWidget {
  const CreateMeetingViewBody({super.key, required this.eventModel});

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MeetingCubit(),
      child: BlocConsumer<MeetingCubit, MeetingStates>(
        builder: (context, state) {
          MeetingCubit meetingCubit = MeetingCubit.get(context);
          return Column(
            children: [
              TableCalendar(
                firstDay: DateTime.now(),
                lastDay: eventModel.schedulingRange!=0?DateTime.utc(
                  DateTime.now().year ,
                  DateTime.now().month,
                  DateTime.now().day+ eventModel.schedulingRange!.toInt(),
                ):meetingCubit.getLastDate(eventModel: eventModel),
                focusedDay: meetingCubit.focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(meetingCubit.selectedDay, day);
                },
                onDaySelected: meetingCubit.onDaySelected,
                calendarFormat: meetingCubit.calendarFormat,
                onFormatChanged: meetingCubit.onFormatChanged,
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
                    bottom: BorderSide(
                      color: kPrimaryColor,
                      width: 1.5
                    ),
                  ),
                ),
                enabledDayPredicate: (date) {
                  return meetingCubit.isAllowedDay(date: date,eventModel: eventModel);
                },
                daysOfWeekHeight: 40,
                rowHeight: 60,
              ),
            ],
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
