import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import 'custom_filter_bottom_sheet.dart';
import 'custom_filter_row.dart';
import 'custom_row_search_and_account.dart';

class MeetingsScreenViewBody extends StatefulWidget {
  const MeetingsScreenViewBody({super.key});

  @override
  State<MeetingsScreenViewBody> createState() => _MeetingsScreenViewBodyState();
}

class _MeetingsScreenViewBodyState extends State<MeetingsScreenViewBody> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        CustomRowSearchAndAccount(controller: controller),
        SizedBox(
          height: 7,
        ),
        Divider(),
        SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            color: kSecPrimaryColor[200],
            child: CustomFilterRow(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (BuildContext context) {
                    return CustomFilterBottomSheet();
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No meetings are scheduled for',
                ),
                Text('Sunday, February 2')
              ],
            ),
          ),
        )
      ],
    );
  }
}
