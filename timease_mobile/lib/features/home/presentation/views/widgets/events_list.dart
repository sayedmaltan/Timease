import 'package:flutter/material.dart';
import 'package:timease_mobile/features/home/presentation/views/widgets/custom_event_container.dart';

class EventsList extends StatelessWidget {
  const EventsList({
    super.key,
    required this.eventName,
    required this.eventType,
    required this.leftContainerColor,
  });

  final String eventName;
  final String eventType;
  final Color leftContainerColor;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: CustomEventContainer(
          eventName: eventName,
          eventType: eventType,
          leftContainerColor: leftContainerColor,
        ),
      ),
      itemCount: 5,
    );
  }
}
