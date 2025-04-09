import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timease_mobile/core/utils/function/custom_toast.dart';
import 'package:timease_mobile/core/utils/function/logout.dart';
import 'package:timease_mobile/core/widgets/custom_shimmer_loading.dart';
import 'package:timease_mobile/features/event/presentation/manger/event_cubit/user_events_cubit.dart';
import 'package:timease_mobile/features/event/presentation/manger/event_cubit/user_events_state.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/meeting_cubit/meeting_state.dart';
import '../../../../constants.dart';
import '../../../../core/utils/cash_helper.dart';
import '../../../../core/widgets/custom_search.dart';
import 'widgets/custom_your_text.dart';
import 'widgets/events_list.dart';

class EventsScreenViewBody extends StatefulWidget {
  const EventsScreenViewBody({super.key});

  @override
  State<EventsScreenViewBody> createState() => _EventsScreenViewBodyState();
}

class _EventsScreenViewBodyState extends State<EventsScreenViewBody> {
  var controller = TextEditingController();
  late GetUserEventsSuccess userEventsSuccess;
  bool passFirstTime = false;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        UserEventsCubit userEventsCubit = UserEventsCubit.get(context);
        userEventsCubit.getUserEventsList(userId: CashHelper.getData('userId'));
        return Future.delayed(Duration(seconds: 2));
      },
      child: BlocConsumer<UserEventsCubit, UserEventsState>(
        builder: (context, state) {
          if (state is GetUserEventsSuccess) {
            if (!passFirstTime) {
              userEventsSuccess = state;
              passFirstTime = true;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 7,
                ),
                CustomEventSearch(
                  eventListModel: userEventsSuccess.eventsListModel,
                  controller: controller,
                  text: 'Search event Types...',
                ),
                userEventsSuccess.eventsListModel.isNotEmpty
                    ? Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 7,
                            ),
                            Divider(
                              color: kSecPrimaryColor.shade400,
                            ),
                            CustomYourText(
                              text: 'YOUR EVENT TYPES',
                            ),
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
                    : Expanded(
                      child: Center(
                          child: CustomYourText(text: 'No Events Created Yet !'),
                        ),
                    ),
              ],
            );
          }
          else {
            if(state is GetOneEventSuccess||state is CreateMeetingSuccessState)
              {
                UserEventsCubit userEventsCubit = UserEventsCubit.get(context);
                userEventsCubit.getUserEventsList(userId: CashHelper.getData('userId'));
              }
            return Column(
              children: [
                SizedBox(
                  height: 7,
                ),
                CustomEventSearch(
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
        listener: (context, state) async {
          if (state is CreateEventsSuccess || state is UpdateEventsSuccess ||state is DeleteUserEventsSuccess) {
            passFirstTime = false;
          }
          else if (state is GetUserEventsFailure) {
            if (state.errMessage == 'JWT token has expired') {
              logout(context: context);
            }
          } else if (state is DeleteUserEventsFailure) {
            await Future.delayed(Duration(seconds: 2));
            customShowToast(
                msg: 'Failed to delete the event. Please try again later.');
          }   if (state is DeleteUserEventsSuccess) {
            await Future.delayed(Duration(seconds: 2));
            customShowToast(msg: 'Event deleted successfully');
          }
        },
      ),
    );
  }
}
