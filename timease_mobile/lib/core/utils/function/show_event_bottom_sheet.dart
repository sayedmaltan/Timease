import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/utils/app_router.dart';

import '../../../constants.dart';

void showEventModelSheet(context,eventModel){
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
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.edit_note_rounded, color: kPrimaryColor),
              title: Text('Edit event type'),
              onTap: () {
                AppRouter.eventModel=eventModel;
                context.push(AppRouter.updateEventScreen);
              },
            ),
            ListTile(
              leading: Icon(Icons.link, color: kPrimaryColor),
              title: Text('Copy link'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings, color: kPrimaryColor),
              title: Text('View event type details'),
              onTap: () {
                context.push(AppRouter.eventDetailsScreen,extra: eventModel);
              },
            ),
            ListTile(
              leading: Icon(Icons.share, color: kPrimaryColor),
              title: Text('More share options'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.red),
              title: Text('Delete Event Type'),
              onTap: () {},
            ),
          ],
        ),
      );
    },
  );
}
