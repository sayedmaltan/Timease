import 'package:flutter/material.dart';

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
          color: Color.fromARGB(255, 0, 0, 0),
          borderRadius: BorderRadius.circular(30),
        ),
        width: double.infinity,
        child: Center(child: CircularProgressIndicator(
          color: Colors.white,
        )));
  }
}
