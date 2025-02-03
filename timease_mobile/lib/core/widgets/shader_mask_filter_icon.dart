import 'package:flutter/material.dart';

import '../../constants.dart';

class ShadeMaskFilterIcon extends StatelessWidget {
  const ShadeMaskFilterIcon({
    super.key,
    this.iconSize = 25,
     this.onTap,
  });

  final double iconSize;
  final VoidCallback ?onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              kPrimaryColor, // Colored side
              Colors.grey.withOpacity(0.5), // Faded or uncolored side
            ],
          ).createShader(bounds);
        },
        child: Icon(
          Icons.filter_alt,
          size: iconSize,
          color: Colors.white, // Required for ShaderMask to work
        ),
      ),
    );
  }
}
