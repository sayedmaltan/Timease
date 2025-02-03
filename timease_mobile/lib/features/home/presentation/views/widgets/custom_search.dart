import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/core/widgets/custom_text_form_field.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({
    super.key,
    required this.controller,
    required this.text,
  });

  final TextEditingController controller;
  final String text;

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: CustomTextFormField(
        suffixIconColor: Colors.black,
        suffixIconResponse: () {
          widget.controller.text = '';
          setState(() {});
        },
        onChanged: (value) => setState(() {}),
        borderRadiusSize: 28,
        focusedBorderColor: kSecPrimaryColor,
        hintStyleWeight: FontWeight.w400,
        suffixIcon: widget.controller.text.isNotEmpty ? Icons.close : null,
        hintText: widget.text,
        keyboardType: TextInputType.text,
        isPassword: false,
        controller: widget.controller,
        validator: (value) {
          return null;
        },
        prefixIcon: Icons.search,
      ),
    );
  }
}
