import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_row_search_and_account.dart';
import 'events_list.dart';

class EventsScreenViewBody extends StatefulWidget {
  const EventsScreenViewBody({super.key});

  @override
  State<EventsScreenViewBody> createState() => _EventsScreenViewBodyState();
}

class _EventsScreenViewBodyState extends State<EventsScreenViewBody> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 7,
        ),
        CustomRowSearchAndAccount(controller: controller),
        SizedBox(
          height: 7,
        ),
        Divider(
          color: kSecPrimaryColor.shade400,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('YOUR EVENT TYPES',
              style: Styles.textStyleBlack.copyWith(
                color: kSecPrimaryColor.shade600,
              )),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: EventsList(
              eventName: 'Event name',
              eventType: 'One-one one, 30 mins',
              leftContainerColor: kPrimaryColor,
            ),
          ),
        )
      ],
    );
  }
}
