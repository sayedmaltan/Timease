import 'package:flutter/material.dart';
import 'package:timease_mobile/core/utils/styles.dart';
import 'package:timease_mobile/core/widgets/custom_text_form_field.dart';

class CustomFieldColumn extends StatelessWidget {
  final String hintText;
  final String aboveHintText;
  final TextEditingController controller;
  final FormFieldValidator validator;

  const CustomFieldColumn({
    super.key,
    required this.hintText,
    required this.aboveHintText,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          aboveHintText,
          style: Styles.textStyle15,
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          keyboardType: TextInputType.emailAddress,
          hintText: hintText,
          isPassword: false,
          controller: controller,
          validator: validator,
        ),
        SizedBox(
          height: 14,
        ),
      ],
    );
  }
}
