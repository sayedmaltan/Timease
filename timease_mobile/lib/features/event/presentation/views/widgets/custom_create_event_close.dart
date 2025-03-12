import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomCreateEventClose extends StatelessWidget {
  const CustomCreateEventClose({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          iconSize: 29,
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.close,
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
