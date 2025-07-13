import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/core/utils/function/build_container_decoration.dart';
import 'package:timease_mobile/core/utils/function/show_event_book_sheet.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import '../../../../../core/utils/function/get_last_date.dart';
import '../../../../../core/utils/function/show_event_bottom_sheet.dart';
import '../../../../../core/utils/styles.dart';

class CustomEventContainer extends StatelessWidget {
  final EventModel eventModel;
  final Color color;
  final bool isBooking;

  const CustomEventContainer({
    super.key,
    required this.eventModel,
    required this.color,
    required this.isBooking,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!eventModel.isPeriodic!) {
          if (!getLastDate(eventModel: eventModel).isBefore(DateTime.now())) {
            isBooking
                ? showEventBookSheet(context, eventModel)
                : showEventModelSheet(context, eventModel);
          }
        } else {
          isBooking
              ? showEventBookSheet(context, eventModel)
              : showEventModelSheet(context, eventModel);
        }
      },
      child: Container(
        height: 79,
        decoration: buildContainerDecoration(),
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
              child: Center(
                  child: Text(
                      '${eventModel.title?[0].toUpperCase()}${eventModel.title?[1].toUpperCase()}')),
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
