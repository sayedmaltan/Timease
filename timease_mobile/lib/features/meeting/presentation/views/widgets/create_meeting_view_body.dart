import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/utils/app_router.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import 'package:timease_mobile/features/meeting/data/models/confirm_meeting_args_model.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/create_meeting_cubit/create_meeting_cubit.dart';
import '../../../../../core/utils/function/custom_toast.dart';
import '../../../../../core/widgets/custom_shimmer_loading.dart';
import '../../manger/create_meeting_cubit/create_meeting_state.dart';
import 'custom_meeting_table_calender.dart';
import 'custom_time_empty_button.dart';

class CreateMeetingViewBody extends StatelessWidget {
  const CreateMeetingViewBody({super.key, required this.eventModel});

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateMeetingCubit, CreateMeetingState>(
      builder: (context, state) {
        CreateMeetingCubit createMeetingCubit = CreateMeetingCubit.get(context);
        return Column(
          spacing: 20,
          children: [
            CustomMeetingTableCalender(
              eventModel: eventModel,
              createMeetingCubit: createMeetingCubit,
            ),
            if (createMeetingCubit
                .getAvailableTimeList(eventModel: eventModel)
                .isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTimeEmptyButton(
                        text: createMeetingCubit.availableTimeList[index],
                        response: () {
                          context.push(
                            AppRouter.confirmMeetingScreenView,
                            extra: ConfirmMeetingArgsModel(
                              eventModel: eventModel,
                              startTime: createMeetingCubit.availableTimeList[index],
                              hostName: '${eventModel.user!.firstName} ${eventModel.user!.lastName}'
                            ),
                          );
                        },
                      ),
                    );
                  },
                  itemCount: createMeetingCubit.availableTimeList.length,
                ),
              ),
            if ((state is CheckFullyBookedLoadingState) &&
                createMeetingCubit.availableTimeList.isEmpty)
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
