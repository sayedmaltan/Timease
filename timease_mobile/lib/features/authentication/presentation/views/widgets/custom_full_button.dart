import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/core/utils/app_router.dart';

import '../../../../../core/utils/styles.dart';

class CustomFullButton extends StatelessWidget {
  const CustomFullButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 58,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      minWidth: double.infinity,
      color: kPrimaryColor,
      onPressed: () {
        context.push(AppRouter.loginScreen);
      },
      child: Text('Create an account', style: Styles.textStyleFullButton),
    );
  }
}
