import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double? suffixIconSize;
  final Color focusedBorderColor;
  final Color? enabledBorderColor;
  final double borderRadiusSize;
  final FontWeight hintStyleWeight;
  final VoidCallback? suffixIconResponse;
  final VoidCallback? onTap;
  final Color suffixIconColor;
  final bool isPasswordShown;
  final ValueChanged? onChanged;
  final ValueChanged? onSaved;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.isPassword,
    required this.controller,
    required this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.focusedBorderColor = kPrimaryColor,
    this.borderRadiusSize = 12,
    this.hintStyleWeight = FontWeight.normal,
    this.suffixIconResponse,
    this.suffixIconColor = kSecPrimaryColor,
    this.isPasswordShown = false,
    this.onChanged,
    this.onTap,
    this.enabledBorderColor,
    this.suffixIconSize,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      decoration: InputDecoration(
        prefixIconColor: kSecPrimaryColor.shade600,
        suffixIconColor: kSecPrimaryColor,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixIconResponse,
                icon: Icon(
                  suffixIcon,
                  size: suffixIconSize ?? 30,
                  color: suffixIconColor,
                ),
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusedBorderColor,
          ),
          borderRadius: BorderRadius.circular(borderRadiusSize),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusSize),
          borderSide: BorderSide(color: enabledBorderColor ?? kSecPrimaryColor),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: kSecPrimaryColor,
          fontWeight: hintStyleWeight,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      obscureText: isPassword
          ? isPasswordShown
              ? false
              : true
          : false,
    );
  }
}
