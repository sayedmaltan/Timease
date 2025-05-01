import 'package:flutter/material.dart';
import 'package:timease_mobile/core/widgets/custom_search.dart';

import 'custom_account_icon.dart';

class CustomRowSearchAndAccount extends StatelessWidget {
  const CustomRowSearchAndAccount({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomEventSearch(
            controller: controller,
            text: 'Search Your Schedule...',
          ),
        ),
        CustomAccountIcon(),
        SizedBox(
          width: 8,
        )
      ],
    );
  }
}
