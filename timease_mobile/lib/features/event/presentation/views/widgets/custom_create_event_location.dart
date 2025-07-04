import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class CustomCreateEventLocation extends StatelessWidget {
  const CustomCreateEventLocation({
    super.key,
    required this.onExpansionChanged,
    required this.isOpen,
    required this.locationController,
  });

  final bool isOpen;
  final ValueChanged<bool> onExpansionChanged;
  final TextEditingController locationController;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: kSecPrimaryColor.shade100),
      child: ExpansionTile(
        tilePadding: EdgeInsets.only(left: 22, top: 9, right: 22),
        childrenPadding: EdgeInsets.only(left: 22, right: 22,),
        onExpansionChanged: onExpansionChanged,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Location",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (!isOpen)
              Text(
                locationController.text,
                style: Styles.textStyle12.copyWith(
                  color: kSecPrimaryColor,
                  fontSize: 13,
                ),
              )
          ],
        ),
        children: [
          CustomTextFormField(
            hintText: 'Enter event location',
            keyboardType: TextInputType.text,
            isPassword: false,
            controller: locationController,
            validator: (value) {
              if(value.toString().isEmpty)
              {
                return 'this field is required';
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}
