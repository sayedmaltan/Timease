import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/core/utils/styles.dart';
import 'package:timease_mobile/features/home/presentation/views/widgets/custom_row_search_and_account.dart';
import 'package:timease_mobile/features/home/presentation/views/widgets/home_view_body_events_list.dart';

class HomeScreenViewBody extends StatefulWidget {
  const HomeScreenViewBody({super.key});

  @override
  State<HomeScreenViewBody> createState() => _HomeScreenViewBodyState();
}

class _HomeScreenViewBodyState extends State<HomeScreenViewBody> {
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
          child: Text('YOUR EVENT TYPES',style: Styles.textStyleBlack.copyWith(color: kSecPrimaryColor.shade600)),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: HomeViewBodyEventsList(
              eventName: 'Event name',
              eventType: 'One-one one, 30 mins',
              leftContainerColor: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

