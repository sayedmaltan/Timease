import 'package:flutter/material.dart';

import '../../../../../core/utils/function/custom_create_event_error.dart';
import '../../../../../core/widgets/custom_full_button.dart';
import '../../../data/models/create_event_model.dart';
import '../../manger/event_cubit/user_events_cubit.dart';
import '../create_new_event_screen.dart';

class CustomCreateEventSaveChangesButton extends StatelessWidget {
  const CustomCreateEventSaveChangesButton({
    super.key,
    required this.userEventsCubit,
    required this.isPeriodic,
    required this.availabilitiesItemModelList,
    required this.isUnavailable,
    required this.startTimeList,
    required this.endTimeList,
    required this.formKey,
    required this.descriptionController,
    required this.titleController,
    required this.customController,
    required this.selectedDuration,
    required this.selectedTimeType,
    required this.inviteeLimitController,
    required this.schedulingRangeController,
    required this.widget,
  });

  final UserEventsCubit userEventsCubit;
  final bool isPeriodic;
  final List<AvailabilitiesItemModel> availabilitiesItemModelList;
  final List<bool> isUnavailable;
  final List<TextEditingController> startTimeList;
  final List<TextEditingController> endTimeList;
  final GlobalKey<FormState> formKey;
  final TextEditingController descriptionController;
  final TextEditingController titleController;
  final TextEditingController customController;
  final String selectedDuration;
  final String selectedTimeType;
  final TextEditingController inviteeLimitController;
  final TextEditingController schedulingRangeController;
  final CreateNewEventScreen widget;

  @override
  Widget build(BuildContext context) {
    return CustomFullButton(
      height: 45,
      text: 'Save changes',
      onPressed: () {
        var availability = userEventsCubit.getAvailabilitiesList(
          isPeriodic: isPeriodic,
          availabilitiesItemModelList:
              availabilitiesItemModelList.map((e) => e.toJson()).toList(),
          isUnavailable: isUnavailable,
          startTimeList: startTimeList,
          endTimeList: endTimeList,
        );
        if (formKey.currentState!.validate()) {
          if (availability.isEmpty) {
            showError(
                context: context,
                msg:
                    'Availability is required. Please enter your available time.');
          } else if (!areFieldsValid(
              startTimeList, endTimeList, isUnavailable)) {
            showError(
              context: context,
              msg:
                  'Please provide the available empty days or cancel selection',
            );
          } else if (descriptionController.text.isEmpty) {
            showError(
              context: context,
              msg:
                  'Event description is required.Provide details about the event.',
            );
          } else if (schedulingRangeController.text == '0' && isPeriodic) {
            showError(
              context: context,
              msg: 'Enter schedulingRange Value',
            );
          } else {
            CreateEventModel createEventModel = CreateEventModel.fromJson({
              "title": titleController.text,
              "description": descriptionController.text,
              "location": "Conference Room A",
              "duration": userEventsCubit.getDurationByMinutes(
                customController: customController,
                selectedDuration: selectedDuration,
                selectedTimeType: selectedTimeType,
              ),
              "maxAttendees": userEventsCubit
                  .getInviteeLimit(controller: inviteeLimitController)
                  .toString(),
              "schedulingRange":
                  isPeriodic ? schedulingRangeController.text : null,
              "availabilities": availability,
              "periodic": isPeriodic
            });
            if (widget.eventModel == null) {
              userEventsCubit.createNewEvent(
                createEventModel: createEventModel,
              );
            } else {
              userEventsCubit.updateNewEvent(
                createEventModel: createEventModel,
                eventId: widget.eventModel!.id!,
              );
            }
          }
        } else {
          showError(
              msg: '"Please fill all required fields before proceeding."',
              context: context);
        }
      },
    );
  }

  bool areFieldsValid(List<TextEditingController> startTimeList,
      List<TextEditingController> endTimeList, List<bool> isUnavailable) {
    for (int i = 0; i < startTimeList.length; i++) {
      if (!isUnavailable[i] &&
          (startTimeList[i].text.isEmpty || endTimeList[i].text.isEmpty)) {
        return false;
      }
    }
    return true;
  }
}
