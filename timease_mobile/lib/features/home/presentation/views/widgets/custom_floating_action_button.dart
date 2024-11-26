import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kPrimaryColor,
      shape: CircleBorder(),
      onPressed: () {},
      child: Icon(
        color: Colors.white,
        Icons.add,
      ),
    );
  }
}
