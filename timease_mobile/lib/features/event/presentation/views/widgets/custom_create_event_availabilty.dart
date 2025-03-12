import 'package:flutter/material.dart';
import 'package:timease_mobile/core/widgets/custom_text_form_field.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_availabilty_row.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/date_specific_hours.dart';
import '../../../../../constants.dart';
import '../../../data/models/create_event_model.dart';

class CustomCreateEventAvailability extends StatefulWidget {
  const CustomCreateEventAvailability({
    super.key,
    required this.days,
    required this.isUnavailable,
    required this.startTimeList,
    required this.endTimeList,
    required this.isPeriodic,
    required this.schedulingRangeController,
    required this.isPeriodicChanged,
    required this.availabilitiesItemModelList,
  });

  final bool isPeriodic;
  final ValueChanged<bool>? isPeriodicChanged;
  final TextEditingController schedulingRangeController;
  final List<bool> isUnavailable;
  final List<TextEditingController> startTimeList;
  final List<TextEditingController> endTimeList;
  final List<String> days;
  final List<AvailabilitiesItemModel> availabilitiesItemModelList;

  @override
  State<CustomCreateEventAvailability> createState() =>
      _CustomCreateEventAvailabilityState();
}

class _CustomCreateEventAvailabilityState
    extends State<CustomCreateEventAvailability> {
  bool isDaysOpen = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: kSecPrimaryColor.shade100,
      ),
      child: ExpansionTile(
        initiallyExpanded: false,
        title: Text(
          "Availability",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        tilePadding: EdgeInsets.only(left: 22, top: 9, right: 22),
        childrenPadding: EdgeInsets.only(left: 22, right: 22, top: 10),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 22.0),
            child: SwitchListTile(
              title: Text(
                "Periodic",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                "Enable Weekly Days",
                style: TextStyle(
                    fontSize: 13, color: Colors.grey[600]),
              ),
              value: widget.isPeriodic,
              onChanged: widget.isPeriodicChanged,
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              secondary:
                  Icon(Icons.notifications, size: 24, color: kPrimaryColor),
              activeColor: kPrimaryColor,
              // Switch color when active
              tileColor: Color(0xFFF8FBF6),
              // Light background
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          widget.isPeriodic
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Invitees can schedule '),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isDaysOpen = !isDaysOpen;
                            });
                          },
                          child: Text(
                            '${widget.schedulingRangeController.text} days ^',
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ),
                        const Text(' into the future'),
                      ],
                    ),
                    if (isDaysOpen)
                      Row(
                        spacing: 10,
                        children: [
                          Radio(
                            value: true,
                            groupValue: true,
                            onChanged: (bool? value) {
                              // You can add logic here if you want to handle multiple radio buttons
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 130,
                              height: 45,
                              child: CustomTextFormField(
                                onChanged: (value) {
                                  setState(() {});
                                },
                                hintText: 'periodic days',
                                keyboardType: TextInputType.number,
                                isPassword: false,
                                controller: widget.schedulingRangeController,
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 355,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return CustomCreateEventAvailabilityRow(
                            day: widget.days[index],
                            startTimeController: widget.startTimeList[index],
                            endTimeController: widget.endTimeList[index],
                            isUnavailable: widget.isUnavailable[index],
                            onRemove: () {
                              setState(() {
                                widget.isUnavailable[index] = true;
                              });
                            },
                            onAdd: () {
                              setState(() {
                                widget.isUnavailable[index] = false;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                )
              : DateSpecificHours(
                  availabilitiesList: widget.availabilitiesItemModelList,
                ),
        ],
      ),
    );
  }
}

