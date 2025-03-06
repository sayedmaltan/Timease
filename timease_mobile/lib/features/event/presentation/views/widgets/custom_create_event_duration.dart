import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../create_new_event_screen.dart';
import 'custom_drop_down_button.dart';

class CustomCreateEventDuration extends StatelessWidget {
  const CustomCreateEventDuration({
    super.key,
    required this.isOpen,
    required this.formKey,
    required this.customController,
    required this.selectedDuration,
    required this.selectedTimeType,
    required this.durations,
    required this.timeType,
    required this.onExpansionChanged,
    required this.dropDown1Changed,
    required this.dropdown2Changed,
  });

  final bool isOpen;
  final GlobalKey<FormState> formKey;
  final TextEditingController customController;
  final String selectedDuration;
  final String selectedTimeType;
  final List<String> durations;
  final List<String> timeType;
  final ValueChanged<bool> onExpansionChanged;
  final ValueChanged<String?> dropDown1Changed;
  final ValueChanged<String?> dropdown2Changed;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: kSecPrimaryColor.shade100,
        splashColor: kPrimaryColor.shade100,
      ),
      child: ExpansionTile(
        onExpansionChanged: onExpansionChanged,
        minTileHeight: 30,
        tilePadding: EdgeInsets.only(left: 22, top: 9, right: 22),
        childrenPadding: EdgeInsets.only(left: 22, right: 22, top: 10),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Duration",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (!isOpen)
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: kSecPrimaryColor,
                    size: 18,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${getDuration(customController: customController, selectedDuration: selectedDuration, selectedTimeType: selectedTimeType).values.first} ${getDuration(customController: customController, selectedDuration: selectedDuration, selectedTimeType: selectedTimeType).keys.first}',
                    style: Styles.textStyle12
                        .copyWith(color: kSecPrimaryColor, fontSize: 13),
                  )
                ],
              )
          ],
        ),
        children: [
          CustomDropDownButton(
            dropDownChanged: dropDown1Changed,
            durations: durations,
            selectedDuration: selectedDuration,
          ),
          SizedBox(
            height: 10,
          ),
          if (selectedDuration.compareTo("Custom") == 0)
            Row(
              spacing: 10,
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 47,
                    child: CustomTextFormField(
                      enabledBorderColor: Color(0XFFA1B89D),
                      focusedBorderColor: Color(0XFFA1B89D),
                      hintText: '',
                      keyboardType: TextInputType.number,
                      isPassword: false,
                      controller: customController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: CustomDropDownButton(
                    dropDownChanged: dropdown2Changed,
                    durations: timeType,
                    selectedDuration: selectedTimeType,
                  ),
                ),
              ],
            ),
          SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}
