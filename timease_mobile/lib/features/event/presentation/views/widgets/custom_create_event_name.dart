import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_create_event_form_field.dart';

class CustomCreateEventName extends StatelessWidget {
  const CustomCreateEventName({
    super.key,
    required this.titleController,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22.0, bottom: 4),
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
            validator: (value) {
              if(value!.isEmpty)
              {
                return 'Please provide an event name';
              }
              return null;
            },
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
      ],
    );
  }
}
