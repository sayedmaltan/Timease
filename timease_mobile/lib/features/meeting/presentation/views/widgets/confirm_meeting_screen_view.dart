import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/core/utils/styles.dart';
import 'package:timease_mobile/core/widgets/custom_full_button.dart';
import 'package:timease_mobile/features/meeting/data/models/confirm_meeting_args_model.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/meeting_cubit/meeting_cubit.dart';
import 'package:timease_mobile/features/meeting/presentation/views/widgets/custom_confirm_meeting_build_attendee.dart';

class ConfirmMeetingScreenView extends StatelessWidget {
  const ConfirmMeetingScreenView({
    super.key,
    required this.confirmMeetingArgsModel,
  });

  final ConfirmMeetingArgsModel confirmMeetingArgsModel;

  @override
  Widget build(BuildContext context) {
    MeetingCubit meetingCubit = MeetingCubit.get(context);
    String dayOfWeak = DateFormat('EEE').format(meetingCubit.selectedDay!);
    String date = DateFormat("MMMM d, y").format(meetingCubit.selectedDay!);
    DateTime startTime = DateFormat("hh:mm a").parse(confirmMeetingArgsModel.startTime);
    DateTime endTime24hr = startTime
        .add(Duration(minutes: confirmMeetingArgsModel.eventModel.duration!));
    String endTime12hr = DateFormat("hh:mm a").format(endTime24hr);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios, color: kPrimaryColor),
        ),
        title: Text("Confirm meeting",
            style: Styles.textStyleBlack.copyWith(
              fontSize: 17.5,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
              color: kPrimaryColor,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Meeting details",
                    style: Styles.textStyleBlack.copyWith(fontSize: 16),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                          "${confirmMeetingArgsModel.eventModel.title}, ${confirmMeetingArgsModel.eventModel.duration} mins"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "$dayOfWeak, $date ${confirmMeetingArgsModel.startTime} - $endTime12hr\n(Africa/Cairo)",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Attendees",
                    style: Styles.textStyleBlack.copyWith(fontSize: 16),
                  ),
                  CustomConfirmMeetingBuildAttendee(
                      name: "Sayed Ahmed", isHost: true),
                  CustomConfirmMeetingBuildAttendee(
                    name: "ElSayed Ahmed",
                    isHost: false,
                  ),
                  Spacer(),
                  CustomFullButton(
                    text: "Schedule meeting",
                    onPressed: () {},
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
