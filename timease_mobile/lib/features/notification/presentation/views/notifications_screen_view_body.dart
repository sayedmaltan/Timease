import 'package:flutter/material.dart';
import '../../../../core/utils/function/logout.dart';

class NotificationsScreenViewBody extends StatelessWidget {
  const NotificationsScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () async {
          logout(context: context);
        },
        child: Text('LOGOUT'),
      ),
    );
  }
}
