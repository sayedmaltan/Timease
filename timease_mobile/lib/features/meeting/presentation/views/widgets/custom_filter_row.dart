import 'package:flutter/material.dart';
import '../../../../../core/widgets/shader_mask_filter_icon.dart';
import '../../../../event/presentation/views/widgets/custom_your_text.dart';

class CustomFilterRow extends StatelessWidget {
  const CustomFilterRow({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomYourText(
          text: 'UPCOMING SCHEDULE',
        ),
        Spacer(),
        ShadeMaskFilterIcon(
          onTap: onTap,
          iconSize: 32,
        ),
        SizedBox(
          width: 25,
        )
      ],
    );
  }
}
