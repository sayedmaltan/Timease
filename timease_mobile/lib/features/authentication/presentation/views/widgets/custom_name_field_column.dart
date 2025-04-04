import 'package:flutter/material.dart';
import 'package:timease_mobile/features/authentication/presentation/views/widgets/custom_field_column.dart';

class CustomNameFieldColumn extends StatelessWidget {
  const CustomNameFieldColumn({
    super.key,
    required this.hintText,
    required this.aboveHintText,
    required this.firstNameController,
    required this.firstNameValidator,
    required this.lastNameValidator,
    required this.lastNameController,
  });

  final String hintText;
  final String aboveHintText;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  final FormFieldValidator firstNameValidator;
  final FormFieldValidator lastNameValidator;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: CustomFieldColumn(
            hintText: 'John',
            aboveHintText: 'First Name',
            controller: firstNameController,
            validator: firstNameValidator,
          ),
        ),
        Expanded(
          child: CustomFieldColumn(
            hintText: 'Doe',
            aboveHintText: 'Last Name',
            controller: lastNameController,
            validator: lastNameValidator,
          ),
        ),
      ],
    );
  }
}
