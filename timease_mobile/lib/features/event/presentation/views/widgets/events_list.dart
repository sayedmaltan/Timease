import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';
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
    int counter=0;
    return ListView.builder(
      itemBuilder: (context, index) {
       if( counter>=colorsList.length) {
         counter=0;
       }
        return Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: CustomEventContainer(
          isBooking: false,
          eventModel: eventsList[index],
          color: colorsList[counter++],
        ),
      );
      },
      itemCount: eventsList.length,
    );
  }
}
