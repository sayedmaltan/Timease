import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timease_mobile/core/utils/styles.dart';

class CustomTextButtonWithoutBack extends StatelessWidget {
  const CustomTextButtonWithoutBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {},
      child: Text(
        'Forget Password?',
        style: Styles.textStyle12,
      ),
    );
  }
}
