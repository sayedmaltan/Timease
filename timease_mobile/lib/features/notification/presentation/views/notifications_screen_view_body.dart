import 'package:flutter/material.dart';
import 'package:timease_mobile/core/utils/styles.dart';
import 'package:timease_mobile/features/notification/presentation/views/widgets/notification_item.dart';
import '../../../../core/utils/function/logout.dart';

class NotificationsScreenViewBody extends StatelessWidget {
  const NotificationsScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 14,
      children: [
        Row(
          children: [
            SizedBox(
              width: 18,
            ),
            Text(
              'Notifications',
              style: Styles.textFormField.copyWith(
                color: Colors.black,
                fontSize: 26,
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return NotificationItem(index: index,);
            },
          ),
        ),
        TextButton(
          onPressed: () async {
            logout(context: context);
          },
          child: Text('LOGOUT'),
        ),
      ],
    );
  }
}
