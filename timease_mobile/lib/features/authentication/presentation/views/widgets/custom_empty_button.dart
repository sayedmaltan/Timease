
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class CustomEmptyButton extends StatelessWidget {
  const CustomEmptyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 58,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: kPrimaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      minWidth: double.infinity,
      onPressed: () {},
      child: Text(
        'Sign in',
        style: Styles.textStyleSpaceButton,
      ),
    );
  }
}
