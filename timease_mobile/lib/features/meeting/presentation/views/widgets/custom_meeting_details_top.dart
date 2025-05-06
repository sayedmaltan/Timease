import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/dates_converter.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/get_user_meetings_model.dart';

class CustomMeetingDetailsTop extends StatelessWidget {
  const CustomMeetingDetailsTop({
    super.key,
    required this.meetings,
  });

  final Meetings meetings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        spacing: 6,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 10,
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: kPrimaryColor,
              ),
              Expanded(
                child: SizedBox(
                  height: 35,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Text(
                      '${index != 0 ? ' and ' : ''}${meetings.attendees![index].firstName} ${meetings.attendees![index].firstName}',
                      style: Styles.textStyleBlack.copyWith(fontSize: 23),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    itemCount: meetings.attendees!.length,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Column(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DatesConverter.convertDateFormat3(
                    date: meetings.date!,
                  ),
                  style: Styles.textStyle14.copyWith(
                    color: Colors.black45,
                  ),
                ),
                Text(
                  '${DatesConverter.convert24hrTo12(time24Hr: meetings.startTime!)} - ${DatesConverter.convert24hrTo12(time24Hr: meetings.endTime!)} (GMT+02:00)',
                  style: Styles.textStyle14.copyWith(color: Colors.black45),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
