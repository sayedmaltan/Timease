import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/core/utils/function/show_meeting_model_sheet.dart';
import 'package:timease_mobile/core/widgets/custom_full_button.dart';
import 'package:timease_mobile/features/meeting/data/models/get_user_meetings_model.dart';
import 'package:timease_mobile/features/meeting/presentation/views/widgets/custom_meeting_details_top.dart';
import 'package:timease_mobile/features/meeting/presentation/views/widgets/custom_tab_bar_body.dart';
import '../../../../core/utils/styles.dart';

class MeetingDetailsScreen extends StatelessWidget {
  const MeetingDetailsScreen({super.key, required this.meetings});

  final Meetings meetings;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 12,
            children: [
              SizedBox(height: 5,),
              CustomMeetingDetailsTop(meetings: meetings),
              TabBar(
                labelStyle: Styles.textStyleBlack,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: kPrimaryColor,
                tabs: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Details'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Notes'),
                  ),
                ],
              ),
              CustomTabBarBody(meetings: meetings),
              Padding(
                padding: const EdgeInsets.only(bottom: 23, left: 23, right: 23),
                child: CustomFullButton(
                  text: 'Book follow-up',
                  onPressed: () {
                    showMeetingModelSheet(context, meetings);
                  },
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


