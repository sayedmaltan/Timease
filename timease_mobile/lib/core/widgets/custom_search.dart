import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class CustomEventSearch extends StatelessWidget {
  const CustomEventSearch({
    super.key,
    required this.controller,
    required this.text,
    this.onSaved,
    this.onChanged,
    this.suffixIconResponse,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String text;
  final ValueChanged? onSaved;
  final ValueChanged? onChanged;
  final void Function()? suffixIconResponse;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CustomTextFormField(
        suffixIconColor: Colors.black,
        onSaved: onSaved,
        onChanged: onChanged,
        borderRadiusSize: 28,
        focusedBorderColor: kSecPrimaryColor,
        hintStyleWeight: FontWeight.w400,
        hintText: text,
        keyboardType: TextInputType.text,
        isPassword: false,
        controller: controller,
        validator: (value) {
          return null;
        },
        suffixIcon: suffixIcon,
        suffixIconResponse: suffixIconResponse,
        prefixIcon: Icons.search,
      ),
    );
  }
}
