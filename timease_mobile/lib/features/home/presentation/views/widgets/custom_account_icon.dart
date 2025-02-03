import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class CustomAccountIcon extends StatelessWidget {
  const CustomAccountIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: CircleBorder(),
        minimumSize: Size(20, 20),
        backgroundColor: kSecPrimaryColor.shade400,
      ),
      onPressed: () {},
      child: Text(
        'S',
        style: Styles.textStyleBlack,
      ),
    );
  }
}