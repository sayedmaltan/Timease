import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.response,
    required this.icon,
    this.height = 42,
    this.width = 42,
    this.color,
    this.backgroundColor,
  });

  final VoidCallback response;
  final IconData icon;
  final double height;
  final double width;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: IconButton(
        color: Colors.black.withOpacity(.9),
        icon: Icon(
          icon,
          color: color,
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor??kSecPrimaryColor.shade400,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11),
            ),
          ),
        ),
        onPressed: response,
      ),
    );
  }
}

