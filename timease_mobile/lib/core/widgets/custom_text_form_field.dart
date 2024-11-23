import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController controller;
  final FormFieldValidator validator;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.isPassword,
    required this.controller,
    required this.validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isPasswordShown = false;
  Icon suffixIcon = Icon(Icons.remove_red_eye_sharp);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator:widget.validator,
      decoration: InputDecoration(
        suffixIconColor: kTextFFieldColor,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  isPasswordShown
                      ? suffixIcon = Icon(Icons.remove_red_eye_sharp)
                      : suffixIcon = Icon(Icons.visibility_off_sharp);
                  isPasswordShown = !isPasswordShown;
                  setState(() {});
                },
                icon: suffixIcon,
              )
            : null,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: kTextFFieldColor)),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: kTextFFieldColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      obscureText: widget.isPassword
          ? isPasswordShown
              ? false
              : true
          : false,
    );
  }
}
