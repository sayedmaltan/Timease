import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_available_time_row.dart';

import '../../../../../core/utils/function/custom_box_decoration.dart';
import '../../../../../core/utils/styles.dart';

class CustomAvailableTime extends StatelessWidget {
  const CustomAvailableTime({
    super.key,
    required this.icon,
    required this.superTitle,
  });

  final IconData icon;
  final String superTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: customBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 48,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Icon(
                  icon,
                  color: Colors.grey.shade700,
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  superTitle,
                  style: Styles.textStyleBlack.copyWith(fontSize: 17),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text('WEEKLY HOURS'),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: kSecPrimaryColor.shade400),
              ),
              child: Column(
                children: [
                  CustomAvailableTimeRow(day: 'Mondays', time: '9:00AM-5:00PM'),
                  CustomAvailableTimeRow(day: 'Mondays', time: '9:00AM-5:00PM'),
                  CustomAvailableTimeRow(day: 'Mondays', time: '9:00AM-5:00PM'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
