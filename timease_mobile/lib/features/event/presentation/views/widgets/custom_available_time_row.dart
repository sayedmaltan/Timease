import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';

import '../../../../../core/utils/styles.dart';

class CustomAvailableTimeRow extends StatelessWidget {
  const CustomAvailableTimeRow(
      {super.key, required this.day, required this.time});

  final String day;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Text(
            day,
            style: time.compareTo('Unavailable') == 0
                ? Styles.textStyle15.copyWith(
                fontWeight: FontWeight.w400,
                color: kSecPrimaryColor
            )
                : Styles.textStyle15,
          ),
          Spacer(),
          Text(
            time,
            style: time.compareTo('Unavailable') == 0
                ? Styles.textStyle15.copyWith(
              fontWeight: FontWeight.w400,
              color: kSecPrimaryColor
            )
                : Styles.textStyle15,
          )
        ],
      ),
    );
  }
}
