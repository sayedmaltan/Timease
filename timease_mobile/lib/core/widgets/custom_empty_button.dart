import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/utils/app_router.dart';
import 'package:timease_mobile/core/widgets/custom_full_button.dart';

import '../../constants.dart';
import '../utils/styles.dart';

class CustomEmptyButton extends StatelessWidget {
  final String text;
  final double height;
  final VoidCallback response;

  const CustomEmptyButton({
    super.key,
    required this.text,
    required this.response,
     this.height=57,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: kPrimaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      minWidth: double.infinity,
      onPressed: response,
      child: Text(
        text,
        style: Styles.textStyleSpaceButton,
      ),
    );
  }
}
