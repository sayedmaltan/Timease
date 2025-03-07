import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/core/utils/app_router.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import '../../../../../core/utils/styles.dart';

class CustomEventContainer extends StatelessWidget {
  final EventModel eventModel;
  final Color color;

  const CustomEventContainer({
    super.key,
    required this.eventModel,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.eventDetailsScreen, extra: eventModel);
      },
      child: Container(
        height: 74,
        decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: kSecPrimaryColor.shade300, width: 1),
              top: BorderSide(
                color: kSecPrimaryColor.shade300,
                width: 0.6,
              ),
              bottom: BorderSide(color: kSecPrimaryColor.shade300, width: 1.2),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(
                  10.0,
                  10.0,
                ),
                blurRadius: 5.0,
                spreadRadius: -5.0,
              ),
              BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(
                  10.0,
                  -10.0,
                ),
                blurRadius: 1.0,
                spreadRadius: -10.0,
              ),
              BoxShadow(
                color: Colors.white,
              ),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              height: double.infinity,
              width: 8,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(10),
                    topStart: Radius.circular(10)),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventModel.title.toString(),
                    style: Styles.textStyleBlack,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    eventModel.description.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle12
                        .copyWith(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: kSecPrimaryColor.shade300,
                shape: BoxShape.circle,
              ),
              child: Center(child: Text('SA')),
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
