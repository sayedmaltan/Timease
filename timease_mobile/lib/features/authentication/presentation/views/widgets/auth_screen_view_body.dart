import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/core/utils/app_router.dart';
import 'package:timease_mobile/core/utils/styles.dart';
import 'package:timease_mobile/core/widgets/custom_empty_button.dart';
import 'package:timease_mobile/core/widgets/custom_full_button.dart';
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
            style: Styles.textStyle42,
          ),
          Text(
            "on the go",
            style: Styles.textStyle42.copyWith(color: kPrimaryColor),
          ),
          Spacer(),
          CustomFullButton(
            text: 'Create an Account',
            onPressed: () => context.push(AppRouter.registerScreen),
          ),
          SizedBox(
            height: 18,
          ),
          CustomEmptyButton(
            response: () => context.push(AppRouter.loginScreen),
            text: 'Sign in',
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
