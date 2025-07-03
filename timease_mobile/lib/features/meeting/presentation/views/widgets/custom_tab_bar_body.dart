import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/dates_converter.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/get_user_meetings_model.dart';

class CustomTabBarBody extends StatelessWidget {
  const CustomTabBarBody({
    super.key,
    required this.meetings,
  });

  final Meetings meetings;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meeting Details',
                    style: Styles.textStyleBlack,
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text('Location'),
                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.article_outlined),
                      Text(DatesConverter.convertDateFormat2(
                          date: meetings.date!)),
                    ],
                  ),
                  Text(
                    'Invitee details',
                    style: Styles.textStyleBlack,
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: kSecPrimaryColor,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 28,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Text(
                              '${index != 0 ? ' and ' : ''}${meetings.attendees![index].firstName} ${meetings.attendees![index].lastName}',
                              style: Styles.textStyleSpaceButton,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            itemCount: meetings.attendees!.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.check_circle),
                      Text('Scheduled'),
                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.mail_outline),
                      Text(
                        'sayedmaltan@gmail.com',
                        style:
                            Styles.textStyleSpaceButton.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.phone_iphone),
                      Text('Phone number'),
                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.public),
                      Text('Gulf Standard Time'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Text('Notes'),
        ],
      ),
    );
  }
}

