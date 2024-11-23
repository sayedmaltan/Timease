import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/styles.dart';

class CustomTextOpacity extends StatelessWidget {
  final String text;
  final double opacity;

  const CustomTextOpacity({
    super.key,
    required this.text,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Text(
        text,
        style: Styles.textStyle15,
      ),
    );
  }
}
