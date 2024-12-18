import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';

class CustomLoadingButton extends StatelessWidget {
  final double height;

  const CustomLoadingButton({
    super.key,
    this.height = 56,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        width: double.infinity,
        child: Center(child: CircularProgressIndicator(
        )));
  }
}
