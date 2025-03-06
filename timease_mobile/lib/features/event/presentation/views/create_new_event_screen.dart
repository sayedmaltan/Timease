import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/widgets/custom_full_button.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_divider.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_host.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_invitee.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_location.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_duration.dart';

class CreateNewEventScreen extends StatefulWidget {
  const CreateNewEventScreen({super.key});

  @override
  State<CreateNewEventScreen> createState() => _CreateNewEventScreenState();
}

class _CreateNewEventScreenState extends State<CreateNewEventScreen> {
  bool isOpenDuration = false;
  bool isInviteeOpen = false;
  bool isHostOpen = false;
  String selectedDuration = "15 min";
  final List<String> durations = [
    "15 min",
    "30 min",
    "45 min",
    "60 min",
    "Custom"
  ];
  String selectedTimeType = "min";
  final List<String> timeType = [
    "min",
    "hr",
  ];
  TextEditingController customController = TextEditingController();
  TextEditingController inviteeLimitController =
      TextEditingController(text: '2');
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    iconSize: 29,
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.close,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              CustomCreateEventDivider(),
              CustomCreateEventDuration(
                isOpen: isOpenDuration,
                formKey: formKey,
                customController: customController,
                selectedDuration: selectedDuration,
                selectedTimeType: selectedTimeType,
                durations: durations,
                timeType: timeType,
                onExpansionChanged: (value) {
                  isOpenDuration = value;
                  if (formKey.currentState!.validate()) {}
                  setState(() {});
                },
                dropDown1Changed: (newValue) {
                  customController.text = '';
                  setState(() {
                    selectedDuration = newValue!;
                  });
                },
                dropdown2Changed: (newValue) {
                  setState(() {
                    selectedTimeType = newValue!;
                  });
                },
              ),
              CustomCreateEventDivider(),
              CustomCreateEventLocation(
                onExpansionChanged: (value) {},
              ),
              CustomCreateEventDivider(),
              CustomCreateEventInvitee(
                inviteeLimitController: inviteeLimitController,
                isOpen: isInviteeOpen,
                onExpansionChanged: (value) {
                  isInviteeOpen = value;
                  setState(() {});
                },
              ),
              CustomCreateEventDivider(),
              CustomCreateEventHost(
                imageSize: 20,
                isHostOpen: isHostOpen,
                onExpansionChanged: (value) {
                  isHostOpen = value;
                  setState(() {});
                },
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: CustomFullButton(
                  height: 45,
                  text: 'Save changes',
                  response: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Map<String, String> getDuration(
    {required TextEditingController customController,
    required String selectedDuration,
    required String selectedTimeType}) {
  if (customController.text.isNotEmpty) {
    return {selectedTimeType: customController.text};
  } else if (selectedDuration.compareTo('Custom') == 0) {
    return {'min': '15'};
  }
  return {selectedDuration.split(' ')[1]: selectedDuration.split(' ')[0]};
}
