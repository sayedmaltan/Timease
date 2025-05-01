import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timease_mobile/core/utils/function/custom_toast.dart';
import 'package:timease_mobile/core/utils/function/logout.dart';
import 'package:timease_mobile/core/widgets/custom_shimmer_loading.dart';
import 'package:timease_mobile/features/event/presentation/manger/event_cubit/user_events_cubit.dart';
import 'package:timease_mobile/features/event/presentation/manger/event_cubit/user_events_state.dart';
import 'package:timease_mobile/features/meeting/presentation/views/widgets/custom_meeting_search.dart';
import '../../../../constants.dart';
import 'widgets/custom_your_text.dart';
import 'widgets/events_list.dart';

class EventsScreenViewBody extends StatelessWidget {
  const EventsScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        UserEventsCubit userEventsCubit = UserEventsCubit.get(context);
        userEventsCubit.getUserEventsList();
        return Future.delayed(Duration(seconds: 2));
      },
      child: BlocConsumer<UserEventsCubit, UserEventsState>(
        builder: (context, state) {
          UserEventsCubit userEventsCubit = UserEventsCubit.get(context);
          if (state is GetUserEventsSuccess || state is SearchEventsState) {
            if (state is GetUserEventsSuccess) {
              userEventsCubit.originalEvents = state.eventsListModel;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 7,
                ),
                CustomMeetingSearch(
                  controller: userEventsCubit.eventController,
                  text: 'Search Event Types',
                  onChanged: (value) {
                    userEventsCubit.searchEvents(
                        eventModelList: userEventsCubit.originalEvents);
                  },
                  suffixIconResponse: () {
                    userEventsCubit.eventController.text = '';
                    userEventsCubit.searchEvents(
                        eventModelList: userEventsCubit.originalEvents);
                  },
                  suffixIcon: userEventsCubit.eventController.text.isEmpty
                      ? null
                      : Icons.close,
                ),
                SizedBox(
                  height: 7,
                ),
                Divider(
                  color: kSecPrimaryColor.shade400,
                ),
                CustomYourText(
                  text: 'YOUR EVENT TYPES',
                ),
                if (state is GetUserEventsSuccess)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: EventsList(
                              eventsList: state.eventsListModel,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else if (state is SearchEventsState)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: EventsList(
                        eventsList: state.eventsListModel,
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: Center(
                      child: CustomYourText(text: 'No Events Created Yet !'),
                    ),
                  ),
              ],
            );
          } else {
            return Column(
              children: [
                SizedBox(
                  height: 7,
                ),
                CustomMeetingSearch(
                  controller: TextEditingController(),
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
        listener: (context, state) async {
          if (state is GetUserEventsFailure) {
            if (state.errMessage == 'JWT token has expired') {
              logout(context: context);
            }
          } else if (state is DeleteUserEventsFailure) {
            await Future.delayed(Duration(seconds: 2));
            customShowToast(
                msg: 'Failed to delete the event. Please try again later.');
          } else if (state is DeleteUserEventsSuccess) {
            await Future.delayed(Duration(seconds: 2));
            customShowToast(msg: 'Event deleted successfully');
          }
          if (state is DeleteUserEventsSuccess ||
              state is CreateEventsSuccess ||
              state is UpdateEventsSuccess ||
              state is DeleteUserEventsFailure ||
              state is CreateEventsFailure ||
              state is UpdateEventsFailure) {
            UserEventsCubit userEventsCubit = UserEventsCubit.get(context);
            userEventsCubit.getUserEventsList();
          }
        },
      ),
    );
  }
}
