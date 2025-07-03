import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timease_mobile/core/utils/function/counts_meetings_per_day.dart';
import 'package:timease_mobile/core/widgets/custom_shimmer_loading.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/meeting_cubit/meeting_cubit.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/meeting_cubit/meeting_state.dart';
import 'package:timease_mobile/features/meeting/presentation/views/widgets/custom_meeting_search.dart';
import '../../../../constants.dart';
import '../../../../core/utils/function/custom_toast.dart';
import 'widgets/custom_meeting_box.dart';

class MeetingsScreenViewBody extends StatelessWidget {
  const MeetingsScreenViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        MeetingCubit meetingCubit = MeetingCubit.get(context);
        meetingCubit.getUserMeetingsList();
        return Future.delayed(Duration(seconds: 2));
      },
      child: BlocConsumer<MeetingCubit, MeetingStates>(
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
          MeetingCubit meetingCubit = MeetingCubit.get(context);
          if (state is GetUserMeetingsSuccessState ||
              state is SearchMeetingState) {
            if (state is GetUserMeetingsSuccessState) {
              meetingCubit.originalMeetings =
                  sortMeetingsList(state.getUserMeetingsModel.meetings!);
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                CustomMeetingSearch(
                  controller: meetingCubit.meetingController,
                  text: 'Search Meetings Attenddes',
                  onChanged: (value) {
                    meetingCubit.searchMeetings(
                        meetings: meetingCubit.originalMeetings);
                  },
                  suffixIconResponse: () {
                    meetingCubit.meetingController.text = '';
                    meetingCubit.searchMeetings(
                      meetings: meetingCubit.originalMeetings,
                    );
                  },
                  suffixIcon: meetingCubit.meetingController.text.isEmpty
                      ? null
                      : Icons.close,
                ),
                SizedBox(
                  height: 7,
                ),
                Divider(),
                SizedBox(
                  height: 7,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 10),
                //   child: Container(
                //     color: kSecPrimaryColor[200],
                //     child: CustomFilterRow(
                //       onTap: () {
                //         showModalBottomSheet(
                //           backgroundColor: Colors.white,
                //           context: context,
                //           builder: (BuildContext context) {
                //             return CustomFilterBottomSheet();
                //           },
                //         );
                //       },
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 8,
                ),

                if (state is GetUserMeetingsSuccessState)
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.getUserMeetingsModel.meetings!.length,
                      itemBuilder: (context, index) => CustomMeetingBox(
                        meetingTitle:
                            state.getUserMeetingsModel.meetings![index].title!,
                        meetingModel:
                            state.getUserMeetingsModel.meetings![index],
                      ),
                    ),
                  ),
                if (state is SearchMeetingState)
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.meetings.length,
                      itemBuilder: (context, index) => CustomMeetingBox(
                        meetingTitle: state.meetings[index].title!,
                        meetingModel: state.meetings[index],
                      ),
                    ),
                  ),
              ],
            );
          } else {
            if (state is! GetUserMeetingsLoadingState &&
                state is! GetUserMeetingsFailureState
            &&  state is! DeleteUserMeetingLoading
            ) {
              MeetingCubit meetingCubit = MeetingCubit.get(context);
              meetingCubit.getUserMeetingsList();
            }
            return Column(
              children: [
                SizedBox(
                  height: 7,
                ),
                CustomMeetingSearch(
                  controller: TextEditingController(),
                  text: 'Book Meeting Types',
                ),
                SizedBox(
                  height: 7,
                ),
                Divider(
                  color: kSecPrimaryColor.shade400,
                ),
                Expanded(child: CustomShimmerLoading()),
              ],
            );
          }
        },
      ),
    );
  }
}
