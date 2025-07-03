import 'package:flutter/material.dart';
import 'package:timease_mobile/features/meeting/data/models/get_user_meetings_model.dart';

import '../../../../meeting/presentation/views/widgets/custom_meeting_box.dart';

class SelectedMeetingsScreen extends StatelessWidget {
  const SelectedMeetingsScreen({super.key, required this.selectedMeetings});

  final List<Meetings> selectedMeetings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: selectedMeetings.length,
          itemBuilder: (context, index) => CustomMeetingBox(
            meetingTitle: selectedMeetings[index].id!,
            meetingModel: selectedMeetings[index],
          ),
        ),
      ),
    );
  }
}
