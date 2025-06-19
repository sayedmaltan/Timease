import 'package:flutter/material.dart';
import 'package:timease_mobile/features/notification/presentation/views/widgets/rich_text_button.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: index < 2 ? Color(0xfff6fbff) : null,
          border: Border(
            top: BorderSide(
              color: Color(0xffeaebed),
              width: 0.5,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              index == 0
                  ? 'assets/images/zoom.png'
                  : index == 1
                      ? "assets/images/google-meet.png"
                      : "assets/images/Microsoft-Teams.png",
              height: 65,
              width: 65,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichTextButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
