import 'package:flutter/material.dart';

class CustomAvailableTimeRow extends StatelessWidget {
  const CustomAvailableTimeRow(
      {super.key, required this.day, required this.time});

  final String day;
  final String time;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(day),
        Spacer(),
        Text(
          time,
        )
      ],
    );
  }
}
