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
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_name.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_availability.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_close.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_description.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_divider.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_host.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_invitee.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_location.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_duration.dart';
import '../../data/models/create_event_model.dart';

class CreateNewEventScreen extends StatefulWidget {
   CreateNewEventScreen({
    super.key,
    this.isPeriodic = true,
    required this.startTimeList,
    required this.endTimeList,
    required this.schedulingRangeController,
    required this.availabilitiesItemModelList,
     this.selectedTimeType='min',
     this.selectedDuration= "15 min",
     required this.customController,
     required this.titleController,
     required this.inviteeLimitController,
     required this.descriptionController,
  });

  late String selectedTimeType;
  late  bool isPeriodic;
  late List<TextEditingController> startTimeList;
  late TextEditingController schedulingRangeController;
  late String selectedDuration ;
  late List<TextEditingController> endTimeList;
  late List<AvailabilitiesItemModel> availabilitiesItemModelList;
  late TextEditingController customController;
  late TextEditingController titleController;
  late TextEditingController inviteeLimitController;
  late TextEditingController descriptionController;



  @override
  State<CreateNewEventScreen> createState() => _CreateNewEventScreenState();
}

class _CreateNewEventScreenState extends State<CreateNewEventScreen> {

  List<bool> isUnavailable = List.filled(7, false);
  bool isOpenDuration = false;
  bool isInviteeOpen = false;
  bool isDescriptionOpen = false;
  bool isHostOpen = false;
  final List<String> durations = [
    "15 min",
    "30 min",
    "45 min",
    "60 min",
    "Custom"
  ];
  final List<String> timeType = [
    "min",
    "hr",
  ];
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
                    CustomCreateEventName(titleController: widget.titleController),
                    CustomCreateEventDivider(),
                    CustomCreateEventDuration(
                      isOpen: isOpenDuration,
                      customController: widget.customController,
                      selectedDuration: widget.selectedDuration,
                      selectedTimeType: widget.selectedTimeType,
                      durations: durations,
                      timeType: timeType,
                      onExpansionChanged: (value) {
                        isOpenDuration = value;
                        if (formKey.currentState!.validate()) {}
                        setState(() {});
                      },
                      dropDown1Changed: (newValue) {
                       widget. customController.text = '';
                        setState(() {
                          widget. selectedDuration = newValue!;
                        });
                      },
                      dropdown2Changed: (newValue) {
                        setState(() {
                          widget.selectedTimeType = newValue!;
                        });
                      },
                    ),
                    CustomCreateEventDivider(),
                    CustomCreateEventLocation(
                      onExpansionChanged: (value) {},
                    ),
                    CustomCreateEventDivider(),
                    CustomCreateEventAvailability(
                      availabilitiesItemModelList: widget.availabilitiesItemModelList,
                      days: days,
                      isUnavailable: isUnavailable,
                      startTimeList: widget.startTimeList,
                      endTimeList:widget.endTimeList,
                      isPeriodic:widget.isPeriodic,
                      schedulingRangeController: widget.schedulingRangeController,
                      isPeriodicChanged: (bool value) {
                        setState(() {
                          widget.isPeriodic = value;
                        });
                      },
                    ),
                    CustomCreateEventDivider(),
                    CustomCreateEventInvitee(
                      inviteeLimitController: widget.inviteeLimitController,
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
                      descriptionController: widget.descriptionController,
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
                                var availability =
                                    userEventsCubit.getAvailabilitiesList(
                                  isPeriodic: widget.isPeriodic,
                                  availabilitiesItemModelList:
                                  widget.availabilitiesItemModelList
                                          .map((e) => e.toJson())
                                          .toList(),
                                  isUnavailable: isUnavailable,
                                  startTimeList: widget.startTimeList,
                                  endTimeList: widget.endTimeList,
                                );
                                if (formKey.currentState!.validate()) {
                                  if (availability.isEmpty) {
                                    showError(
                                        context: context,
                                        msg:
                                            'Availability is required. Please enter your available time.');
                                  } else if (widget.descriptionController
                                      .text.isEmpty) {
                                    showError(
                                        context: context,
                                        msg:
                                            'Event description is required.Provide details about the event.');
                                  } else {
                                    CreateEventModel createEventModel =
                                        CreateEventModel.fromJson({
                                      "title": widget.titleController.text,
                                      "description": widget.descriptionController.text,
                                      "location": "Conference Room A",
                                      "duration":
                                          userEventsCubit.getDurationByMinutes(
                                        customController: widget.customController,
                                        selectedDuration: widget.selectedDuration,
                                        selectedTimeType: widget.selectedTimeType,
                                      ),
                                      "maxAttendees": userEventsCubit
                                          .getInviteeLimit(
                                              controller:
                                              widget.inviteeLimitController)
                                          .toString(),
                                      "schedulingRange": widget.isPeriodic
                                          ? widget.schedulingRangeController.text
                                          : null,
                                      "availabilities": availability,
                                      "periodic": widget.isPeriodic
                                    });
                                    userEventsCubit.createNewEvent(
                                      createEventModel: createEventModel,
                                    );
                                  }
                                } else {
                                  showError(
                                      msg:
                                          '"Please fill all required fields before proceeding."',
                                      context: context);
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
