import 'package:flutter/material.dart';

class RichTextButton extends StatelessWidget {
  const RichTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 4,
      text: const TextSpan(
        style: TextStyle(
          color: Colors.black54, // base color for general text
          fontSize: 15,
          height: 1.4,
        ),
        children: [
          TextSpan(
            text: "ElSayed Ahmed",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff0b1218), // Highlighted name
            ),
          ),
          TextSpan(
              text: " scheduled ", style: TextStyle(color: Color(0xff252c32))),
          TextSpan(
            text: "30 min 1 to 1",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff0b1218), // Highlighted session
            ),
          ),
          TextSpan(
            text:
                " with Sayed Ahmed on Monday, 4 November 2024 at 09:00 Am.\n",
            style: TextStyle(
              color: Color(
                0xff252c32,
              ),
            ),
          ),
          TextSpan(
            text: '2d',
            style: TextStyle(
              color: Color(0xff68707b),
            ),
          )
        ],
      ),
    );
  }
}
