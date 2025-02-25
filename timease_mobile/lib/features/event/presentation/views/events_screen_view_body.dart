import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timease_mobile/core/utils/service_locator.dart';
import 'package:timease_mobile/features/event/data/repos/event_repo_impl.dart';
import 'package:timease_mobile/features/event/presentation/manger/event_cubit/user_events_cubit.dart';
import 'package:timease_mobile/features/event/presentation/manger/event_cubit/user_events_state.dart';
import '../../../../constants.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserEventsCubit(getIt.get<EventRepoImpl>())
        ..getUserEventsList(userId: userId),
      child: BlocConsumer<UserEventsCubit, UserEventsState>(
        builder: (context, state) {
          return state is UserEventsSuccess
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 7,
                    ),
                    CustomSearch(
                      controller: controller,
                      text: 'Search event Types...',
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: EventsList(
                          eventsList: state.eventsListModel,
                        ),
                      ),
                    )
                  ],
                )
              : Center(child: CircularProgressIndicator());
        },
        listener: (context, state) {
          if (state is UserEventsSuccess) {
          } else if (state is UserEventsFailure) {
          } else if (state is UserEventsLoading) {}
        },
      ),
    );
  }
}
