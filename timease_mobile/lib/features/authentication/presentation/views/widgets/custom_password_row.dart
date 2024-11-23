import 'package:flutter/material.dart';
import 'package:timease_mobile/core/utils/styles.dart';
import 'package:timease_mobile/features/authentication/presentation/views/widgets/custom_text_button_without_back.dart';

class CustomPasswordRow extends StatelessWidget {
  final bool isRegister;

  const CustomPasswordRow({
    super.key,
    required this.isRegister,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Password',
          style: Styles.textStyle15,
        ),
        Spacer(),
        if(!isRegister)
        CustomTextButtonWithoutBack(),
      ],
    );
  }
}
