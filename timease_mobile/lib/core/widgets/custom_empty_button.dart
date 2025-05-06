import 'package:flutter/material.dart';
import 'package:timease_mobile/core/utils/styles.dart';

class CustomEmptyButton extends StatelessWidget {
  final String text;
  final double height;
  final VoidCallback response;
  final TextStyle? textStyle;
  final double? borderSide;

  const CustomEmptyButton({
    super.key,
    required this.text,
    required this.response,
    this.height = 57,
    this.textStyle,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: const Color.fromARGB(255, 0, 0, 0),
          width: borderSide?? 2,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      minWidth: double.infinity,
      onPressed: response,
      child: Text(
        text,
        style: textStyle ?? Styles.textStyleSpaceButton,
      ),
    );
  }
}
