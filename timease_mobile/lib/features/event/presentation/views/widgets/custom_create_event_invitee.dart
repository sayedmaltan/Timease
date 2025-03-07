import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class CustomCreateEventInvitee extends StatelessWidget {
  const CustomCreateEventInvitee({
    super.key,
    required this.inviteeLimitController,
    required this.isOpen,
    required this.onExpansionChanged,
  });

  final bool isOpen;
  final ValueChanged<bool> onExpansionChanged;
  final TextEditingController inviteeLimitController;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: kSecPrimaryColor.shade100),
      child: ExpansionTile(
        tilePadding: EdgeInsets.only(left: 22, top: 9, right: 22),
        childrenPadding: EdgeInsets.only(left: 22, right: 22, top: 10),
        onExpansionChanged: onExpansionChanged,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Invitee limit",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (!isOpen)
              Text(
                "Group event with ${inviteeLimitController.text} invitees",
                style: Styles.textStyle12.copyWith(
                  color: kSecPrimaryColor,
                  fontSize: 13,
                ),
              )
          ],
        ),
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Set max invitees for groups:",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: SizedBox(
              width: 100,
              child: CustomTextFormField(
                hintText: '',
                keyboardType: TextInputType.number,
                isPassword: false,
                controller: inviteeLimitController,
                validator: (value) {
                  return 'please enter max invitees in a spot';
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
