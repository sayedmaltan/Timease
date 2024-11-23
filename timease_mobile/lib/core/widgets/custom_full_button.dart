import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/core/utils/styles.dart';


class CustomFullButton extends StatelessWidget {
  final String text;
  final VoidCallback response;
  final double height;

  const CustomFullButton({
    super.key,
    required this.text,
    required this.response,
    this.height=56,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      minWidth: double.infinity,
      color: kPrimaryColor,
      onPressed: response,
      child: Text(text, style: Styles.textStyleFullButton),
    );
  }
}
