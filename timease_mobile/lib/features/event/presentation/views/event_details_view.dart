import 'package:flutter/material.dart';
import 'package:timease_mobile/core/utils/function/sort_availabilities_by_day.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_3layer_container.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_available_time.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_event_details_appbar.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_name_duration.dart';

class EventDetailsView extends StatelessWidget {
  const EventDetailsView({
    super.key,
    required this.eventModel,
  });

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: 10,
          children: [
            CustomEventDetailsAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomNameDuration(
                        eventModel: eventModel,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomAvailableTime(
                        icon: Icons.watch_later_outlined,
                        superTitle: 'Days and times',
                        availabilitiesListModel: sortAvailabilitiesByDay(eventModel.availabilities!),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Custom3LayerContainer(
                        icon: Icons.menu,
                        superTitle: 'Description',
                        title1: 'Location',
                        description1: eventModel.location ?? "NO location yet",
                        title2: 'Details / AGENDA',
                        description2: eventModel.description.toString(),
                      ),
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
