import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';

import '../../../../../core/utils/styles.dart';

class CustomCreateEventFormField extends StatelessWidget {
  const CustomCreateEventFormField({
    super.key,
    required this.controller,
    this.width,
    this.hintText = '',
    this.validator,
  });

  final TextEditingController controller;
  final double? width;
  final String hintText;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 39,
      width: width,
      child: TextFormField(
        validator: validator,
        style: width != 70
            ? Styles.textFormField.copyWith(color: Colors.black87)
            : null,
        controller: controller,
        decoration: InputDecoration(
          prefixStyle: TextStyle(letterSpacing: 0),
          prefixIcon: width != 70
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                  ),
                )
              : null,
          hintStyle: Styles.textFormField,
          filled: true,
          focusedBorder: width != 70 || validator.toString().isNotEmpty
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(15),
                )
              : null,
          fillColor: width == 70 ? Color(0xFFF8FBF6) : Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
        textAlign: width == 70 ? TextAlign.center : TextAlign.left,
      ),
    );
  }
}
