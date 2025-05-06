import 'package:flutter/material.dart';

class RichTextButton extends StatelessWidget {
  const RichTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style:
        TextStyle(color: Colors.black, fontSize: 15, height: 1.4),
        children: [
          TextSpan(
            text: "ElSayed Ahmed",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: " scheduled "),
          TextSpan(
            text: "30 min 1 to 1",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
            " with Sayed Ahmed on Monday, 4 November 2024 at 09:00 EET.",
          ),
        ],
      ),
    );
  }
}