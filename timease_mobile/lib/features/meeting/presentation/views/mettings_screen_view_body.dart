import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timease_mobile/core/widgets/custom_shimmer_loading.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/meeting_cubit/meeting_cubit.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/meeting_cubit/meeting_state.dart';
import '../../../../constants.dart';
import '../../../../core/widgets/custom_search.dart';
import 'widgets/custom_filter_bottom_sheet.dart';
import 'widgets/custom_filter_row.dart';
import 'widgets/custom_meeting_box.dart';

class MeetingsScreenViewBody extends StatelessWidget {
  const MeetingsScreenViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return RefreshIndicator(
      onRefresh: () {
        MeetingCubit meetingCubit = MeetingCubit.get(context);
        meetingCubit.getUserMeetingsList();
        return Future.delayed(Duration(seconds: 2));
      },
      child: BlocConsumer<MeetingCubit, MeetingStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state is GetUserMeetingsSuccessState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                CustomSearch(
                  eventListModel: [],
                  controller: controller,
                  text: 'Search event Types...',
                ),
                SizedBox(
                  height: 7,
                ),
                Divider(),
                SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    color: kSecPrimaryColor[200],
                    child: CustomFilterRow(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (BuildContext context) {
                            return CustomFilterBottomSheet();
                          },
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.getUserMeetingsModel.meetingsNo,
                    itemBuilder: (context, index) => CustomMeetingBox(
                      userId: state.getUserMeetingsModel.meetings![index].id!,
                    ),
                  ),
                ),
              ],
            );
          }
          else {
            if(state is! GetUserMeetingsLoadingState)
            {
              MeetingCubit meetingCubit=MeetingCubit.get(context);
              meetingCubit.getUserMeetingsList();
            }
            return Column(
              children: [
                SizedBox(
                  height: 7,
                ),
                CustomSearch(
                  eventListModel: [],
                  controller: controller,
                  text: 'Search event Types...',
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
