import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class CustomConfirmMeetingBuildAttendee extends StatelessWidget {
  const CustomConfirmMeetingBuildAttendee({super.key, required this.name, required this.isHost});
  final String name;
  final bool isHost;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: kSecPrimaryColor.shade300,
              shape: BoxShape.circle,
            ),
            child: Center(child: Text('SA')),
          ),
          SizedBox(width: 10),
          Text(
            name,
            style: Styles.textStyleBlack.copyWith(fontWeight: FontWeight.w500),
          ),
          if (isHost) ...[
            SizedBox(width: 8),
            Text("Host", style: TextStyle(color: Colors.grey)),
          ]
        ],
      ),
    );
  }
}
