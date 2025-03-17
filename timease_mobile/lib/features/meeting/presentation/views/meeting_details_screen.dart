import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/core/widgets/custom_full_button.dart';
import '../../../../core/utils/styles.dart';

class MeetingDetailsScreen extends StatelessWidget {
  const MeetingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            spacing: 12,
            children: [
              AppBar(
                backgroundColor: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: kPrimaryColor,
                          ),
                          Column(
                            spacing: 5,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sayed and ahmad',
                                style: Styles.textStyleBlack,
                              ),
                              Text(
                                'wed , march , 12 , 2025',
                              ),
                              Text(
                                '11:30 AM - 12:00 PM (GMT+02:00)',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
              Expanded(
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
                                Text('data'),
                              ],
                            ),
                            Text(
                              'Host',
                              style: Styles.textStyleBlack,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kPrimaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: ExpansionTile(
                                  title: Text('Host Details'),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: kPrimaryColor)),
                                  children: [
                                    Divider(),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: 1,
                                      separatorBuilder: (context, index) =>
                                          Divider(),
                                      itemBuilder: (context, index) => ListTile(
                                        title: Text(''),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                                Text('name'),
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
                                Text('mail'),
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomFullButton(
                        text: 'text',
                        onPressed: () {},
                        height: 50,
                      ),
                    ),
                    Expanded(
                      child: CustomFullButton(
                        text: 'text',
                        onPressed: () {},
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}