import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/utils/app_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class CustomMeetingSearch extends StatelessWidget {
  const CustomMeetingSearch({
    super.key,
    required this.controller,
    required this.text,
    this.isMeetingBody = false,
    this.onSaved,
    this.onChanged,
  });

  final TextEditingController controller;
  final String text;
  final bool isMeetingBody;
  final ValueChanged? onSaved;
  final ValueChanged? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CustomTextFormField(
        suffixIconColor: Colors.black,
        onTap: () {
          if (isMeetingBody) {
            context.push(AppRouter.tryBookMeetingView, extra: controller);
          }
        },
        onSaved: onSaved,
        onChanged: onChanged,
        borderRadiusSize: 28,
        focusedBorderColor: kSecPrimaryColor,
        hintStyleWeight: FontWeight.w400,
        hintText: text,
        keyboardType: isMeetingBody ? TextInputType.none : TextInputType.text,
        isPassword: false,
        controller: controller,
        validator: (value) {
          return null;
        },
        prefixIcon: Icons.search,
      ),
    );
  }
}
