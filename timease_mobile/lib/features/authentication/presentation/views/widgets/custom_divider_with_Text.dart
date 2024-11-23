import 'package:flutter/cupertino.dart';
import 'package:timease_mobile/core/widgets/my_divider.dart';

class CustomDividerWithText extends StatelessWidget {
  final String text;

  const CustomDividerWithText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.3,
      child: Row(
        children: [
          Expanded(
            child: MyDivider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(text),
          ),
          Expanded(child: MyDivider()),
        ],
      ),
    );
  }
}
