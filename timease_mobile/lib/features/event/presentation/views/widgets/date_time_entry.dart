import 'package:flutter/material.dart';

class DateTimeEntry extends StatelessWidget {
  final String date;
  final String timeRange;
  final VoidCallback onRemove;

  const DateTimeEntry({
    super.key,
    required this.date,
    required this.timeRange,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Color(0xFFF8FBF6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              date,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            Expanded(flex: 2, child: const SizedBox()),
            Text(
              timeRange,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            Expanded(flex: 1, child: const SizedBox()),
            GestureDetector(
              onTap: onRemove,
              child: Icon(
                Icons.close,
                color: Colors.black87,
                size: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
