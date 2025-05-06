import 'package:flutter/material.dart';
import 'package:timease_mobile/features/notification/presentation/views/widgets/rich_text_button.dart';
import 'package:timease_mobile/features/notification/presentation/views/widgets/view_contact_button.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Color(0xFFF0FBF8),
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.grey,
            width: 0.3,
          ),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.event, size: 18, color: Colors.grey),
                    SizedBox(width: 6),
                    Text(
                      "New Event Scheduled",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Text(
                  "26w ago",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            RichTextButton(),
            const SizedBox(height: 16),
            ViewContactButton(),
          ],
        ),
      ),
    );
  }
}
