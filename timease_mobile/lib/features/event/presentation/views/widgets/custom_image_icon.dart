import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class CustomImageIcon extends StatelessWidget {
  const CustomImageIcon({
    super.key,
    this.size = 27,
     this.textSize,
  });

  final double size;
  final double ?textSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(size, size),
        backgroundColor: kSecPrimaryColor.shade300,
      ),
      onPressed: () {},
      child: Text(
        'S',
        style: Styles.textStyle12.copyWith(
          color: kSecPrimaryColor.shade600,
          fontSize: textSize??10,
        ),
      ),
    );
  }
}
