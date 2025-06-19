import 'package:flutter/material.dart';

import '../../../../../core/utils/asstes.dart';


class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetsImages.timeaseLogo,
          width: 180,
          height: 100,
          fit: BoxFit.cover,
        ),
        // SizedBox(
        //   width: 6,
        // ),
        // Text(
        //   'Timease',
        //   style: Styles.customRowTextStyle,
        // ),
      ],
    );
  }
}