import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/utils/function/custom_box_decoration.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class CustomEventDetailsAppBar extends StatelessWidget {
  const CustomEventDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: customBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () => context.pop(),
              icon: Icon(
                Icons.arrow_back,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Center(
              child: Text(
                'Event type details',
                style: Styles.textStyle15.copyWith(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
