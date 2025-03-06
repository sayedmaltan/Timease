import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/function/custom_box_decoration.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.dropDownChanged,
    required this.durations,
    required this.selectedDuration,
  });

  final ValueChanged<String?> dropDownChanged;
  final List<String> durations;
  final String selectedDuration;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: buildBoxDecorationCrEvent(),
      child: Padding(
        padding: const EdgeInsets.only(right: 14.0),
        child: DropdownButton<String>(
          iconEnabledColor: kPrimaryColor,
          icon: Icon(Icons.keyboard_arrow_down_outlined),
          underline: SizedBox.shrink(),
          value: selectedDuration,
          isExpanded: true,
          items: durations.map((String duration) {
            return DropdownMenuItem<String>(
              value: duration,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(duration,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    )),
              ),
            );
          }).toList(),
          onChanged: dropDownChanged,
        ),
      ),
    );
  }
}
