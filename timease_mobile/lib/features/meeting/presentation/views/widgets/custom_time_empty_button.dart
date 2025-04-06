import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_empty_button.dart';

class CustomTimeEmptyButton extends StatelessWidget {
  const CustomTimeEmptyButton({
    super.key,
    required this.text,
    required this.response,
  });

  final String text;
  final VoidCallback response;

  @override
  Widget build(BuildContext context) {
    return CustomEmptyButton(
      text: text,
      borderSide: 1.2,
      textStyle: Styles.textStyleSpaceButton
          .copyWith(fontWeight: FontWeight.w900, fontSize: 16),
      response:response,
    );
  }
}