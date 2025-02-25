import 'package:flutter/material.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_event_container.dart';

class EventsList extends StatelessWidget {
  const EventsList({
    super.key,
    required this.eventsList,
  });

  final List<EventModel> eventsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: CustomEventContainer(
          eventModel: eventsList[index],
        ),
      ),
      itemCount: eventsList.length,
    );
  }
}
