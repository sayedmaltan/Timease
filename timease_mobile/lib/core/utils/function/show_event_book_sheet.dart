import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/utils/app_router.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/meeting_cubit/meeting_cubit.dart';

import '../../../constants.dart';

void showEventBookSheet(
  context,
  EventModel eventModel,
) {
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
              leading: Icon(Icons.event, color: kPrimaryColor),
              title: Text('Book meeting'),
              onTap: () {
                context.pop();
                MeetingCubit meetingCubit = MeetingCubit.get(context);
                meetingCubit.selectedDay = null;
                meetingCubit.availabilityId = null;
                meetingCubit.focusedDay = DateTime.now();
                meetingCubit.availableTimeList = [];
                context.push(AppRouter.createMeetingScreenView,
                    extra: eventModel);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: kPrimaryColor),
              title: Text('View event type details'),
              onTap: () {
                context.pop();
                context.push(
                  AppRouter.eventDetailsScreen,
                  extra: eventModel,
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
