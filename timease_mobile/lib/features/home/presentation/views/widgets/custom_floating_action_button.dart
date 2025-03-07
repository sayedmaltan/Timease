import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/constants.dart';
import '../../../../../core/utils/app_router.dart';


class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kPrimaryColor,
      shape: CircleBorder(),

      onPressed: () {
        context.push(AppRouter.createNewEventScreen);
      },
      child: Icon(
        color: Colors.white,
        Icons.add,
      ),
    );
  }
}
