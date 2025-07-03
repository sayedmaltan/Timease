import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timease_mobile/core/utils/function/counts_meetings_per_day.dart';
import 'package:timease_mobile/features/home/presentation/views/widgets/home_screen_succees_state.dart';
import 'package:timease_mobile/features/meeting/data/models/get_user_meetings_model.dart';
import '../../../../../core/utils/function/build_home_calendar_buildar.dart';
import '../../../../../core/utils/function/custom_toast.dart';
import '../../../../../core/widgets/custom_shimmer_loading.dart';
import '../../../../meeting/presentation/manger/meeting_cubit/meeting_cubit.dart';
import '../../../../meeting/presentation/manger/meeting_cubit/meeting_state.dart';

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
          BlocConsumer<MeetingCubit, MeetingStates>(
            listener: (context, state) async {
              if (state is DeleteUserMeetingFailure) {
                await Future.delayed(Duration(seconds: 2));
                customShowToast(
                  msg: 'Failed to delete the meeting. Please try again later.',
                );
              } else if (state is DeleteUserMeetingSuccess) {
                await Future.delayed(Duration(seconds: 2));
                customShowToast(msg: 'Meeting deleted successfully');
              }
            },
            builder: (context, state) {
              if (state is GetUserMeetingsSuccessState) {
                meetings = state.getUserMeetingsModel.meetings!;
                meetings = sortMeetingsList(meetings);
                selectedMeetings = getSelectedMeetings(
                    meetings: meetings, selectedDate: selectedDay);
                return Expanded(
                  child: HomeScreenSuccessState(
                    focusedDay: focusedDay,
                    selectedDay: selectedDay,
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(
                        () {
                          this.selectedDay = selectedDay;
                          this.focusedDay = focusedDay;
                          selectedMeetings = getSelectedMeetings(
                            meetings: meetings,
                            selectedDate: selectedDay,
                          );
                        },
                      );
                    },
                    calendarFormat: calendarFormat,
                    onFormatChanged: (format) {
                      setState(() {
                        calendarFormat = format;
                      });
                    },
                    calendarBuilders: buildHomeCalendarBuilders(meetings),
                    onPageChanged: (focusedDay) {
                      this.focusedDay = focusedDay;
                    },
                    selectedMeetings: selectedMeetings,
                    meetings: meetings,
                  ),
                );
              } else {
                if (state is! GetUserMeetingsLoadingState &&
                    state is! GetUserMeetingsFailureState &&
                    state is! DeleteUserMeetingLoading) {
                  MeetingCubit meetingCubit = MeetingCubit.get(context);
                  meetingCubit.getUserMeetingsList();
                }
                return Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 350,
                        child: CustomShimmerLoading(
                          height: 350,
                          itemCount: 1,
                        ),
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
