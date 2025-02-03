import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import 'custom_search.dart';
import 'custom_your_text.dart';
import 'events_list.dart';

class EventsScreenViewBody extends StatefulWidget {
  const EventsScreenViewBody({super.key});

  @override
  State<EventsScreenViewBody> createState() => _EventsScreenViewBodyState();
}

class _EventsScreenViewBodyState extends State<EventsScreenViewBody> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
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
              eventName: 'Event name',
              eventType: 'One-one one, 30 mins',
              leftContainerColor: kPrimaryColor,
            ),
          ),
        )
      ],
    );
  }
}

