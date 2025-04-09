import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/utils/cash_helper.dart';
import 'package:timease_mobile/core/utils/function/custom_toast.dart';
import 'package:timease_mobile/core/widgets/custom_loading_button.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
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
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_save_changes_button.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/models/create_event_model.dart';
import '../../data/repos/event_repo_impl.dart';

class CreateNewEventScreen extends StatefulWidget {
  const CreateNewEventScreen({
    super.key,
    this.eventModel,
  });

  final EventModel? eventModel;

  @override
  State<CreateNewEventScreen> createState() => _CreateNewEventScreenState();
}

class _CreateNewEventScreenState extends State<CreateNewEventScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.eventModel == null) {
      isPeriodic = true;
      selectedTimeType = 'min';
      selectedDuration = '15 min';
      titleController = TextEditingController();
      startTimeList =
          List.generate(7, (_) => TextEditingController(text: '12:40'));
      endTimeList =
          List.generate(7, (_) => TextEditingController(text: '14:40'));
      schedulingRangeController = TextEditingController(text: '30');
      availabilitiesItemModelList = [];
      customController = TextEditingController();
      titleController = TextEditingController();
      descriptionController = TextEditingController();
      inviteeLimitController = TextEditingController(text: '2');
    } else {
      List<AvailabilitiesItemModel> ava = [];
      if (!widget.eventModel!.isPeriodic!) {
        for (int i = 0; i < widget.eventModel!.availabilities!.length; i++) {
          ava.add(AvailabilitiesItemModel.fromJson(
              widget.eventModel!.availabilities![i].toJson()));
        }
      }
      availabilitiesItemModelList = ava;
      var list = UserEventsCubit(getIt.get<EventRepoImpl>()).getStartAndEndTime(
          availabilitiesItemModelList: widget.eventModel!.availabilities!,
          isPeriodic: widget.eventModel!.isPeriodic!);
      startTimeList = list[0];
      endTimeList = list[1];
      for (int i = 0; i < startTimeList.length; i++) {
        if (startTimeList[i].text.isEmpty) {
          isUnavailable[i] = true;
        }
      }
      selectedDuration = 'Custom';
      customController =
          TextEditingController(text: widget.eventModel!.duration.toString());
      schedulingRangeController = TextEditingController(
          text: widget.eventModel!.schedulingRange.toString());
      isPeriodic = widget.eventModel!.isPeriodic!;
      titleController = TextEditingController(text: widget.eventModel!.title);
      inviteeLimitController = TextEditingController(
          text: widget.eventModel!.maxAttendees.toString());
      descriptionController =
          TextEditingController(text: widget.eventModel!.description);
    }
  }

  late String selectedTimeType = 'min';
  late bool isPeriodic;
  late List<TextEditingController> startTimeList;
  late TextEditingController schedulingRangeController;
  late String selectedDuration;
  late List<TextEditingController> endTimeList;
  late List<AvailabilitiesItemModel> availabilitiesItemModelList;
  late TextEditingController customController;
  late TextEditingController titleController;
  late TextEditingController inviteeLimitController;
  late TextEditingController descriptionController;
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
                    CustomCreateEventName(titleController: titleController),
                    CustomCreateEventDivider(),
                    CustomCreateEventDescription(
                      descriptionController: descriptionController,
                      isOpen: isDescriptionOpen,
                      onExpansionChanged: (value) {
                        isDescriptionOpen = value;
                        setState(() {});
                      },
                    ),
                    CustomCreateEventDivider(),
                    CustomCreateEventDuration(
                      isOpen: isOpenDuration,
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
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23.0),
                      child: state is CreateEventsLoading ||
                              state is UpdateEventsLoading
                          ? CustomLoadingButton()
                          : CustomCreateEventSaveChangesButton(
                              userEventsCubit: userEventsCubit,
                              isPeriodic: isPeriodic,
                              availabilitiesItemModelList:
                                  availabilitiesItemModelList,
                              isUnavailable: isUnavailable,
                              startTimeList: startTimeList,
                              endTimeList: endTimeList,
                              formKey: formKey,
                              descriptionController: descriptionController,
                              titleController: titleController,
                              customController: customController,
                              selectedDuration: selectedDuration,
                              selectedTimeType: selectedTimeType,
                              inviteeLimitController: inviteeLimitController,
                              schedulingRangeController:
                                  schedulingRangeController,
                              widget: widget),
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
        } else if (state is UpdateEventsSuccess) {
          customShowToast(msg: 'Event updated successfully');
          UserEventsCubit.get(context)
              .getUserEventsList(userId: CashHelper.getData('userId'));
          context.pop();
        }
        if (state is UpdateEventsFailure) {
          customShowToast(msg: state.errMessage);
        }
      },
    );
  }
}
