import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';
import 'custom_create_event_form_field.dart';

class CustomCreateEventAvailabilityRow extends StatelessWidget {
  final String day;
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;
  final bool isUnavailable;
  final VoidCallback onRemove;
  final VoidCallback onAdd;

  const CustomCreateEventAvailabilityRow({
    super.key,
    required this.day,
    required this.startTimeController,
    required this.endTimeController,
    required this.isUnavailable,
    required this.onRemove,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: kPrimaryColor.shade700,
            child: Text(
              day,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 10),
          isUnavailable
              ? Text('Unavailable')
              : Row(
                  children: [
                    CustomCreateEventFormField(
                      controller: startTimeController,
                      width: 70,
                    ),
                    const SizedBox(width: 10),
                    Text('-',
                        style: TextStyle(
                          fontSize: 17,
                        )),
                    const SizedBox(width: 10),
                    CustomCreateEventFormField(
                      controller: endTimeController,
                      width: 70,
                    ),
                  ],
                ),
          const SizedBox(width: 10),
          if (!isUnavailable)
            IconButton(
              icon: Icon(
                Icons.close,
                size: 21,
              ),
              onPressed: onRemove,
            ),
          IconButton(
              icon: Icon(
                Icons.add_circle_outline,
                size: 22,
              ),
              onPressed: onAdd),
        ],
      ),
    );
  }
}
