import 'package:flutter/material.dart';

import '../../../../../core/utils/asstes.dart';
import '../../../../../core/utils/styles.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetsImages.logo,
          height: 45,
          width: 25,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          'Timease',
          style: Styles.customRowTextStyle,
        ),
      ],
    );
  }
}
