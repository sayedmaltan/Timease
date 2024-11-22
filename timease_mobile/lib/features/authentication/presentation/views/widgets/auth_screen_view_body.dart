import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/core/utils/styles.dart';
import 'custom_empty_button.dart';
import 'custom_full_button.dart';
import 'custom_row.dart';

class AuthScreenViewBody extends StatelessWidget {
  const AuthScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
          ),
          CustomRow(),
          SizedBox(
            height: 17,
          ),
          Text(
            "Connect with Timease",
            style: Styles.textStyle40,
          ),
          Text(
            "on the go",
            style: Styles.textStyle40.copyWith(
              color: kPrimaryColor
            ),
          ),
          Spacer(),
          CustomFullButton(),
          SizedBox(
            height: 18,
          ),
          CustomEmptyButton(),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
