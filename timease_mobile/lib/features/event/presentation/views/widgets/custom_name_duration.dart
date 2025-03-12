import 'package:flutter/material.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_3layer_container.dart';

class CustomNameDuration extends StatelessWidget {
  const CustomNameDuration({super.key, required this.eventModel});

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Custom3LayerContainer(
        icon: Icons.content_paste_go_outlined,
        superTitle:  'Name and duration',
        title1: eventModel.title.toString(),
        description1: eventModel.description.toString(),
        title2: 'Duration',
        description2: '${eventModel.duration} Min');
  }
}
