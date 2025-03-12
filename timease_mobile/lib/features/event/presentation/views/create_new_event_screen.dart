import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/utils/function/custom_toast.dart';
import 'package:timease_mobile/core/widgets/custom_full_button.dart';
import 'package:timease_mobile/core/widgets/custom_loading_button.dart';
import 'package:timease_mobile/features/event/presentation/manger/create_event_cubit/create_event_cubit.dart';
import 'package:timease_mobile/features/event/presentation/manger/create_event_cubit/create_events_state.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_availabilty.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_descriptionost.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_divider.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_form_field.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_host.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_invitee.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_location.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_duration.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../core/utils/styles.dart';
import '../../data/models/create_event_model.dart';
import '../../data/repos/event_repo_impl.dart';

class CreateNewEventScreen extends StatefulWidget {
  const CreateNewEventScreen({super.key});

  @override
  State<CreateNewEventScreen> createState() => _CreateNewEventScreenState();
}

class _CreateNewEventScreenState extends State<CreateNewEventScreen> {
  List<AvailabilitiesItemModel> availabilitiesItemModelList = [];
  List<TextEditingController> startTimeList =
      List.generate(7, (_) => TextEditingController(text: '10:30'));
  List<TextEditingController> endTimeList =
      List.generate(7, (_) => TextEditingController(text: '14:40'));
  TextEditingController schedulingRangeController =
      TextEditingController(text: '30');
  List<bool> isUnavailable = List.filled(7, false);
  bool isPeriodic = false;
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
    return BlocProvider(
      create: (context) => CreateEventsCubit(getIt.get<EventRepoImpl>()),
      child: BlocConsumer<CreateEventsCubit, CreateEventsState>(
        builder: (context, state) {
          CreateEventsCubit createEventsCubit = CreateEventsCubit.get(context);
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
                        padding: const EdgeInsets.only(left: 22.0, bottom: 2),
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
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 22,
                        ),
                        child: CustomCreateEventFormField(
                          controller: titleController,
                          hintText: 'Name your event',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 22.0, top: 2, bottom: 14),
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
                        availabilitiesItemModelList:
                            availabilitiesItemModelList,
                        days: days,
                        isUnavailable: isUnavailable,
                        startTimeList: startTimeList,
                        endTimeList: endTimeList,
                        isPeriodic: isPeriodic,
                        schedulingRangeController: schedulingRangeController,
                        isPeriodicChanged: (bool value) {
                          setState(() {
                            isPeriodic = value;
                          });
                        },
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
                        child: state is CreateEventsLoading
                            ? CustomLoadingButton()
                            : CustomFullButton(
                                height: 45,
                                text: 'Save changes',
                                onPressed: () {
                                if(formKey.currentState!.validate())  {
                                    CreateEventModel createEventModel =
                                        CreateEventModel.fromJson({
                                      "title": titleController.text,
                                      "description": descriptionController.text,
                                      "location": "Conference Room A",
                                      "duration": getDurationByMinutes(
                                          customController: customController,
                                          selectedDuration: selectedDuration,
                                          selectedTimeType: selectedTimeType),
                                      "maxAttendees":
                                          inviteeLimitController.text,
                                      "schedulingRange": isPeriodic
                                          ? schedulingRangeController.text
                                          : null,
                                      "availabilities": getAvailabilitiesList(
                                        isPeriodic: isPeriodic,
                                        availabilitiesItemModelList:
                                            availabilitiesItemModelList
                                                .map((e) => e.toJson())
                                                .toList(),
                                        isUnavailable: isUnavailable,
                                        startTimeList: startTimeList,
                                        endTimeList: endTimeList,
                                      ),
                                      "periodic": isPeriodic
                                    });
                                    createEventsCubit.createNewEvent(
                                      createEventModel: createEventModel,
                                    );
                                  }
                                },
                              ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is CreateEventsSuccess) {
            customShowToast(msg: 'Event created successfully');
            context.pop();
          }
        },
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

int getDurationByMinutes(
    {required TextEditingController customController,
    required String selectedDuration,
    required String selectedTimeType}) {
  int duration;
  if (customController.text.isNotEmpty) {
    duration = selectedTimeType == 'hr'
        ? int.parse(customController.text) * 60
        : int.parse(customController.text);
    return duration;
  } else if (selectedDuration.compareTo('Custom') == 0) {
    return 15;
  }
  duration = selectedDuration.split(' ')[1] == 'hr'
      ? int.parse(selectedDuration.split(' ')[0]) * 60
      : int.parse(selectedDuration.split(' ')[0]);
  return duration;
}

List<Map<String, dynamic>> getAvailabilitiesList({
  required bool isPeriodic,
  required List<Map<String, dynamic>> availabilitiesItemModelList,
  required List<bool> isUnavailable,
  required List<TextEditingController> startTimeList,
  required List<TextEditingController> endTimeList,
}) {
  if (isPeriodic) {
    List<Map<String, dynamic>> list = [];
    List<String> days = [
      'SUNDAY',
      'MONDAY',
      'TUESDAY',
      'WEDNESDAY',
      'THURSDAY',
      'FRIDAY',
      'SATURDAY'
    ];
    for (int i = 0; i < 7; i++) {
      if (!isUnavailable[i]) {
        list.add({
          "dayOfWeek": days[i],
          "date": null,
          "startTime": startTimeList[i].text,
          "endTime": endTimeList[i].text
        });
      }
    }
    return list;
  } else {
    return availabilitiesItemModelList;
  }
}
