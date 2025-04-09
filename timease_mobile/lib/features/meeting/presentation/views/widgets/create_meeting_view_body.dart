import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/utils/app_router.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import 'package:timease_mobile/features/meeting/data/models/confirm_meeting_args_model.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/meeting_cubit/meeting_cubit.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/meeting_cubit/meeting_state.dart';
import '../../../../../core/utils/function/custom_toast.dart';
import '../../../../../core/widgets/custom_shimmer_loading.dart';
import 'custom_meeting_table_calender.dart';
import 'custom_time_empty_button.dart';

class CreateMeetingViewBody extends StatelessWidget {
  const CreateMeetingViewBody({super.key, required this.eventModel});

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MeetingCubit, MeetingStates>(
      builder: (context, state) {
        MeetingCubit meetingCubit = MeetingCubit.get(context);
        return Column(
          spacing: 20,
          children: [
            CustomMeetingTableCalender(
              eventModel: eventModel,
              meetingCubit: meetingCubit,
            ),
            if (meetingCubit
                .getAvailableTimeList(eventModel: eventModel)
                .isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTimeEmptyButton(
                        text: meetingCubit.availableTimeList[index],
                        response: () {
                          context.push(
                            AppRouter.confirmMeetingScreenView,
                            extra: ConfirmMeetingArgsModel(
                              eventModel: eventModel,
                              startTime: meetingCubit.availableTimeList[index],
                              hostName: '${eventModel.user!.firstName} ${eventModel.user!.lastName}'
                            ),
                          );
                        },
                      ),
                    );
                  },
                  itemCount: meetingCubit.availableTimeList.length,
                ),
              ),
            if ((state is CheckFullyBookedLoadingState) &&
                meetingCubit.availableTimeList.isEmpty)
              Expanded(child: CustomShimmerLoading())
          ],
        );
      },
      listener: (context, state) {
        if (state is CheckFullyBookedFailureState) {
          customShowToast(msg: state.errMessage);
        }
      },
    );
  }
}
