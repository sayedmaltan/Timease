import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timease_mobile/core/widgets/custom_shimmer_loading.dart';
import 'package:timease_mobile/features/event/presentation/manger/event_cubit/user_events_cubit.dart';
import 'package:timease_mobile/features/meeting/presentation/views/widgets/custom_meeting_search.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/function/custom_toast.dart';
import '../../../../event/presentation/manger/event_cubit/user_events_state.dart';
import '../../../../event/presentation/views/widgets/custom_event_container.dart';

class TryBookMeetingView extends StatelessWidget {
  const TryBookMeetingView({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    UserEventsCubit userEventsCubit = UserEventsCubit.get(context);
    return BlocConsumer<UserEventsCubit, UserEventsState>(
      builder: (context, state) {
        return  Column(
          children: [
            CustomMeetingSearch(
              controller: controller,
              text: 'Enter event id',
              onChanged: (value) {
                userEventsCubit.getEventByEventId(eventId: value);
              },
            ),
            if (state is GetOneEventSuccess)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomEventContainer(
                  isBooking: true,
                  eventModel: state.eventModel,
                  color: kPrimaryColor,
                ),
              ),
            if (state is GetUserEventsLoading)
              SizedBox(
                height: 80,
                child: CustomShimmerLoading(
                  itemCount: 1,
                ),
              )
          ],
        );
      },
      listener: (context, state) {
        if (state is GetOneEventFailure) {
          customShowToast(msg: 'Failed to find event. Please try again later.');
        }
      },
    );
  }
}
