import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timease_mobile/core/utils/function/counts_meetings_per_day.dart';
import 'package:timease_mobile/features/meeting/data/models/get_user_meetings_model.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_shimmer_loading.dart';
import '../../../../meeting/presentation/manger/meeting_cubit/meeting_cubit.dart';
import '../../../../meeting/presentation/manger/meeting_cubit/meeting_state.dart';
import '../../../../meeting/presentation/views/widgets/custom_meeting_box.dart';
import 'custom_home_table_calendar.dart';

class HomeScreenViewBody extends StatefulWidget {
  const HomeScreenViewBody({super.key});

  @override
  State<HomeScreenViewBody> createState() => _HomeScreenViewBodyState();
}

class _HomeScreenViewBodyState extends State<HomeScreenViewBody> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;
  List<Meetings> meetings = [];
  List<Meetings> selectedMeetings = [];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        MeetingCubit meetingCubit = MeetingCubit.get(context);
        meetingCubit.getUserMeetingsList();
        return Future.delayed(Duration(seconds: 2));
      },
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          CustomHomeTableCalendar(
            focusedDay: focusedDay,
            selectedDay: selectedDay,
            onDaySelected: (selectedDay, focusedDay) {
             selectedMeetings= getSelectedMeetings(meetings: meetings, selectedDate: selectedDay);
              setState(
                () {
                  this.selectedDay = selectedDay;
                  this.focusedDay = focusedDay;
                },
              );
            },
            calendarFormat: calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                calendarFormat = format;
              });
            },
          ),
          BlocConsumer<MeetingCubit, MeetingStates>(
            listener: (context, state) async {},
            builder: (context, state) {
              if (state is GetUserMeetingsSuccessState) {
                meetings = state.getUserMeetingsModel.meetings!;
                meetings = sortMeetingsList(meetings);
                selectedMeetings=getSelectedMeetings(meetings: meetings, selectedDate: selectedDay);
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(),
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
                  ),
                );
              } else {
                if (state is! GetUserMeetingsLoadingState &&
                    state is! GetUserMeetingsFailureState) {
                  MeetingCubit meetingCubit = MeetingCubit.get(context);
                  meetingCubit.getUserMeetingsList();
                }
                return Expanded(
                  child: Column(
                    children: [
                      Divider(
                        color: kSecPrimaryColor.shade400,
                      ),
                      Expanded(child: CustomShimmerLoading()),
                    ],
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
