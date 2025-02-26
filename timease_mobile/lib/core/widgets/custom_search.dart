import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/core/widgets/custom_text_form_field.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import 'package:timease_mobile/features/event/presentation/manger/event_cubit/user_events_cubit.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
    required this.controller,
    required this.text,
    required this.eventListModel,
  });

  final List<EventModel> eventListModel;
  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    UserEventsCubit userEventsCubit=UserEventsCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: CustomTextFormField(
        suffixIconColor: Colors.black,
        suffixIconResponse: () {
          controller.text = '';
          userEventsCubit.reStartSearch(eventModelList: eventListModel);
        },
        onChanged: (value) {
          userEventsCubit.searchEventsList(eventModelList: eventListModel, value: value);
        },
        borderRadiusSize: 28,
        focusedBorderColor: kSecPrimaryColor,
        hintStyleWeight: FontWeight.w400,
        suffixIcon: controller.text.isNotEmpty ? Icons.close : null,
        hintText: text,
        keyboardType: TextInputType.text,
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
