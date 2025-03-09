import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/widgets/custom_full_button.dart';
import 'package:timease_mobile/features/event/presentation/views/custom_create_event_availabilty.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_descriptionost.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_divider.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_form_field.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_host.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_invitee.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_location.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_duration.dart';

import '../../../../core/utils/styles.dart';

class CreateNewEventScreen extends StatefulWidget {
  const CreateNewEventScreen({super.key});

  @override
  State<CreateNewEventScreen> createState() => _CreateNewEventScreenState();
}

class _CreateNewEventScreenState extends State<CreateNewEventScreen> {
  List<TextEditingController> startTimeList =
      List.generate(7, (_) => TextEditingController(text: '10:30'));
  List<TextEditingController> endTimeList =
      List.generate(7, (_) => TextEditingController(text: '14:40'));
  List<bool> isUnavailable = List.filled(7, false);
  bool isOpenDuration = false;
  bool isInviteeOpen = false;
  bool isDescriptionOpen = false;
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
  TextEditingController titleController = TextEditingController();
  TextEditingController customController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController inviteeLimitController =
      TextEditingController(text: '2');
  var formKey = GlobalKey<FormState>();
  List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  bool isDayUnavailable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SafeArea(
          child: SingleChildScrollView(
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
                Padding(
                  padding: const EdgeInsets.only(left: 22.0,bottom: 2),
                  child: Text(
                    'EVENT TYPE',
                    style: Styles.textStyle12.copyWith(
                      color: Color(0xFF5A6A3E),
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 22,),
                  child: CustomCreateEventFormField(
                    controller: titleController,
                    hintText: 'Name your event',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0,top: 2,bottom: 14),
                  child: Text(
                    'Group',
                    style: Styles.textStyle14.copyWith(
                      color: Color(0xFF5A6A3E),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
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
                CustomCreateEventAvailability(
                  days: days,
                  isUnavailable: isUnavailable,
                  startTimeList: startTimeList,
                  endTimeList: endTimeList,
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
                CustomCreateEventDivider(),
                CustomCreateEventDescription(
                  descriptionController: descriptionController,
                  isOpen: isDescriptionOpen,
                  onExpansionChanged: (value) {
                    isDescriptionOpen = value;
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
                    onPressed: () {
                      debugPrint("title is ${titleController.text}");
                      debugPrint("description is ${descriptionController.text}");
                      debugPrint("duration is $selectedDuration");
                      debugPrint(
                          "maxAttendees is ${inviteeLimitController.text}");
                      debugPrint("days is ${days[0]}");
                      debugPrint(isUnavailable[1].toString());
                      debugPrint(isUnavailable[0].toString());
                      debugPrint("S is ${startTimeList[0].text}");
                      debugPrint("S is ${endTimeList[0].text}");
                    },
                  ),
                )
              ],
            ),
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
