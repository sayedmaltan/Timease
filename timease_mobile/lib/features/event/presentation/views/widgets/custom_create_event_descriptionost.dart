import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class CustomCreateEventDescription extends StatelessWidget {
  const CustomCreateEventDescription({
    super.key,
    required this.descriptionController,
    required this.isOpen,
    required this.onExpansionChanged,
  });

  final bool isOpen;
  final ValueChanged<bool> onExpansionChanged;
  final TextEditingController descriptionController;

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
              "Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (!isOpen)
              Text(
                descriptionController.text,
                style: Styles.textStyle12.copyWith(
                  color: kSecPrimaryColor,
                  fontSize: 13,
                ),
              )
          ],
        ),
        children: [
          CustomTextFormField(
            hintText: 'Name your description',
            keyboardType: TextInputType.text,
            isPassword: false,
            controller: descriptionController,
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
