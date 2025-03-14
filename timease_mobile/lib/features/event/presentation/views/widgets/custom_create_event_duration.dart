import 'package:flutter/material.dart';
import 'package:timease_mobile/features/event/presentation/manger/event_cubit/user_events_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'custom_drop_down_button.dart';

class CustomCreateEventDuration extends StatelessWidget {
  const CustomCreateEventDuration({
    super.key,
    required this.customController,
    required this.selectedDuration,
    required this.selectedTimeType,
    required this.durations,
    required this.timeType,
    required this.onExpansionChanged,
    required this.dropDown1Changed,
    required this.dropdown2Changed,
    required this.isOpen,
  });

  final bool isOpen;
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
    UserEventsCubit userEventsCubit=UserEventsCubit.get(context);
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
                    '${userEventsCubit.getDuration(customController: customController, selectedDuration: selectedDuration, selectedTimeType: selectedTimeType).values.first} ${userEventsCubit.getDuration(customController: customController, selectedDuration: selectedDuration, selectedTimeType: selectedTimeType).keys.first}',
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
                          return "Field can't be blank";
                        }
                        else if(selectedTimeType=='hr'&&int.parse(value)>6) {
                          return 'enter a valid value';
                        }
                        else if(selectedTimeType=='min'&&int.parse(value)>360) {
                          return 'enter a valid value';
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
