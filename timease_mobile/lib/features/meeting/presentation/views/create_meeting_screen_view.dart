import 'package:flutter/material.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import 'package:timease_mobile/features/meeting/presentation/views/widgets/create_meeting_view_body.dart';

import '../../../../core/utils/styles.dart';

class CreateMeetingScreenView extends StatelessWidget {
  const CreateMeetingScreenView({super.key, required this.eventModel});

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'When do you want to meet?',
          style: Styles.textStyle15,
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: CreateMeetingViewBody(eventModel: eventModel,),
      ),
    );
  }
}
