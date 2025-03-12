import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/utils/cash_helper.dart';
import 'package:timease_mobile/core/utils/function/custom_create_event_error.dart';
import 'package:timease_mobile/core/utils/function/custom_toast.dart';
import 'package:timease_mobile/core/widgets/custom_full_button.dart';
import 'package:timease_mobile/core/widgets/custom_loading_button.dart';
import 'package:timease_mobile/features/event/presentation/manger/event_cubit/user_events_cubit.dart';
import 'package:timease_mobile/features/event/presentation/manger/event_cubit/user_events_state.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_creare_event_name.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_availabilty.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_close.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_descriptionost.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_divider.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_host.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_invitee.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_location.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_duration.dart';
import '../../data/models/create_event_model.dart';

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
  bool isPeriodic = true;
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
    return BlocConsumer<UserEventsCubit, UserEventsState>(
      builder: (context, state) {
        UserEventsCubit userEventsCubit = UserEventsCubit.get(context);
        return Scaffold(
          body: Form(
            key: formKey,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCreateEventClose(),
                    CustomCreateEventName(titleController: titleController),
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
                      availabilitiesItemModelList: availabilitiesItemModelList,
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
                                var availability=userEventsCubit.getAvailabilitiesList(
                                  isPeriodic: isPeriodic,
                                  availabilitiesItemModelList:
                                  availabilitiesItemModelList
                                      .map((e) => e.toJson())
                                      .toList(),
                                  isUnavailable: isUnavailable,
                                  startTimeList: startTimeList,
                                  endTimeList: endTimeList,
                                );
                                if (formKey.currentState!.validate()) {
                                  if(availability.isEmpty)
                                  {
                                    showError(context: context,msg: 'Availability is required. Please enter your available time.');
                                  }
                                 else if(descriptionController.text.isEmpty)
                                  {
                                    showError(context: context,msg: 'Event description is required.Provide details about the event.');
                                  }
                                 else {
                                    CreateEventModel createEventModel =
                                        CreateEventModel.fromJson({
                                      "title": titleController.text,
                                      "description": descriptionController.text,
                                      "location": "Conference Room A",
                                      "duration":
                                          userEventsCubit.getDurationByMinutes(
                                              customController:
                                                  customController,
                                              selectedDuration:
                                                  selectedDuration,
                                              selectedTimeType:
                                                  selectedTimeType),
                                      "maxAttendees": userEventsCubit
                                          .getInviteeLimit(
                                              controller:
                                                  inviteeLimitController)
                                          .toString(),
                                      "schedulingRange": isPeriodic
                                          ? schedulingRangeController.text
                                          : null,
                                      "availabilities":availability,
                                      "periodic": isPeriodic
                                    });
                                    userEventsCubit.createNewEvent(
                                      createEventModel: createEventModel,
                                    );
                                  }
                                }
                                else {
                                  showError(msg: '"Please fill all required fields before proceeding."',context: context);
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
          UserEventsCubit.get(context)
              .getUserEventsList(userId: CashHelper.getData('userId'));
          context.pop();
        }
      },
    );
  }
}
