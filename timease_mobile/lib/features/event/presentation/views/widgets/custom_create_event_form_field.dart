import 'package:flutter/material.dart';

class CustomCreateEventFormField extends StatelessWidget {
  const CustomCreateEventFormField({
    super.key,
    required this.endTimeController,
  });

  final TextEditingController endTimeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 39,
      width: 70,
      child: TextFormField(
        controller: endTimeController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF8FBF6),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none, // Optional: Remove border
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
