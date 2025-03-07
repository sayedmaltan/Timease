import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CustomCreateEventDivider extends StatelessWidget {
  const CustomCreateEventDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      // Always visible divider
      color: kSecPrimaryColor.shade100,
      thickness: 1,
      height: 1,
    );
  }
}
