import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class CustomEventDetailsAppBar extends StatelessWidget {
  const CustomEventDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(
          color: kSecPrimaryColor.shade400
        )),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 0),
            blurRadius: 20.0,
            spreadRadius: -7.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(0, 0),
            blurRadius: 20.0,
            spreadRadius: 0.0,
          ),
          BoxShadow(
            color: Colors.white,
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
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
