import 'package:flutter/material.dart';
import 'package:timease_mobile/core/utils/function/show_meeting_model_sheet.dart';
import 'package:timease_mobile/features/meeting/data/models/get_user_meetings_model.dart';
import '../../../../../core/utils/dates_converter.dart';
import '../../../../../core/utils/function/build_container_decoration.dart';

class CustomMeetingBox extends StatelessWidget {
  const CustomMeetingBox({
    super.key,
    required this.meetingId,
    required this.meetingModel,
  });

  final String meetingId;
  final Meetings meetingModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showMeetingModelSheet(context, meetingModel);
      },
      child: Container(
        width: double.infinity,
        height: 103,
        decoration: buildContainerDecoration(),
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        padding: EdgeInsets.all(10),
        child: Row(
          spacing: 12,
          children: [
            SizedBox(
              width: 5.2,
              height: 80,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Expanded(
                    child: Text(
                      meetingId,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16.5,
                        color: const Color.fromARGB(255, 113, 113, 113),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      getAttendees(meetingModel: meetingModel),
                      style: TextStyle(
                          fontSize: 14.5,
                          color: const Color.fromARGB(255, 30, 30, 30),
                          fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${DatesConverter.convert24hrTo12(time24Hr: meetingModel.startTime.toString())} - ${DatesConverter.convert24hrTo12(time24Hr: meetingModel.endTime.toString())}',
                      style: TextStyle(
                        fontSize: 14.5,
                        color: const Color.fromARGB(255, 30, 30, 30),
                        fontWeight: FontWeight.w300,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String getAttendees({required Meetings meetingModel}) {
    String attendees = '';
    for (var element in meetingModel.attendees!) {
      if (attendees == '') {
        attendees = '$attendees${element.firstName!} ${element.lastName}';
      } else {
        attendees = '$attendees and ${element.firstName!} ${element.lastName}';
      }
    }
    return attendees;
  }
}
