import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/features/meeting/data/models/get_user_meetings_model.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/meeting_cubit/meeting_cubit.dart';
import '../../../constants.dart';

void showMeetingModelSheet(context, Meetings meetingModel) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.edit_note_rounded, color: kPrimaryColor),
              title: Text('Edit meeting'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.link, color: kPrimaryColor),
              title: Text('Copy link'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.share, color: kPrimaryColor),
              title: Text('More share options'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.red),
              title: Text('Delete Meeting Type'),
              onTap: () {
                context.pop();
                context.pop();
                MeetingCubit meeting = MeetingCubit.get(context);
                meeting.deleteUserMeetingItem(
                  meetingId: meetingModel.id!,
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
