import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/core/utils/styles.dart';
import 'package:timease_mobile/core/widgets/custom_text_form_field.dart';

class CustomRowSearchAndAccount extends StatefulWidget {
  const CustomRowSearchAndAccount({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<CustomRowSearchAndAccount> createState() =>
      _CustomRowSearchAndAccountState();
}

class _CustomRowSearchAndAccountState extends State<CustomRowSearchAndAccount> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: CustomTextFormField(
            suffixIconColor: Colors.black,
            suffixIconResponse: () {
              widget.controller.text = '';
              setState(() {});
            },
            onChanged: (value) => setState(() {
            }),
            borderRadiusSize: 28,
            focusedBorderColor: kSecPrimaryColor,
            hintStyleWeight: FontWeight.w400,
            suffixIcon: widget.controller.text.isNotEmpty?Icons.close:null,
            hintText: 'Search event Types...',
            keyboardType: TextInputType.text,
            isPassword: false,
            controller: widget.controller,
            validator: (value) {
              return null;
            },
            prefixIcon: Icons.search,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: CircleBorder(),
            minimumSize: Size(20, 20),
            backgroundColor: kSecPrimaryColor.shade400,
          ),
          onPressed: () {},
          child: Text(
            'S',
            style: Styles.textStyleBlack,
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
