import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class CustomYourText extends StatelessWidget {
  final String text;

  const CustomYourText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(text,
          style: Styles.textStyleBlack.copyWith(
            color: kSecPrimaryColor.shade600,
          )),
    );
  }
}
