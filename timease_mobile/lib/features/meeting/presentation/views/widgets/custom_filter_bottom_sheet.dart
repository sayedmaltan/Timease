import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:timease_mobile/core/widgets/custom_text_form_field.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/function/custom_toast.dart';
import '../../../../../core/widgets/custom_full_button.dart';
import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../../../core/widgets/shader_mask_filter_icon.dart';

class CustomFilterBottomSheet extends StatefulWidget {
  const CustomFilterBottomSheet({
    super.key,
  });

  @override
  State<CustomFilterBottomSheet> createState() =>
      _CustomFilterBottomSheetState();
}

class _CustomFilterBottomSheetState extends State<CustomFilterBottomSheet> {
  final fromDataController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final toDataController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SizedBox(
          height: 335,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 14,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 45,
                      child: Divider(
                        thickness: 6,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShadeMaskFilterIcon(),
                        SizedBox(
                          width: 4,
                        ),
                        Text('Filter', style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                enabledBorderColor: Colors.grey.shade100,
                focusedBorderColor: Colors.grey.shade100,
                suffixIconSize: 15,
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 1),
                  ).then((value) {
                    fromDate = value!;
                    fromDataController.text =
                        DateFormat('dd-MM-yyyy').format(value);
                    setState(() {});
                  });
                },
                suffixIcon: Icons.calendar_today_outlined,
                hintText: 'From Date',
                keyboardType: TextInputType.datetime,
                isPassword: false,
                controller: fromDataController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Start Date';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                enabledBorderColor: Colors.grey.shade100,
                focusedBorderColor: Colors.grey.shade100,
                suffixIconSize: 15,
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 1),
                  ).then(
                    (value) {
                      toDate = value!;
                      toDataController.text =
                          DateFormat('dd-MM-yyyy').format(value);
                      setState(() {});
                    },
                  );
                },
                suffixIcon: Icons.calendar_today_outlined,
                hintText: 'To Date',
                keyboardType: TextInputType.datetime,
                isPassword: false,
                controller: toDataController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Last Date';
                  }
                  return null;
                },
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17.0),
                child: Row(
                  children: [
                    CustomIconButton(
                      response: () {
                        context.pop();
                      },
                      icon: Icons.keyboard_backspace,
                      height: 56,
                      width: 49,
                      color: kPrimaryColor.shade900,
                      backgroundColor: kPrimaryColor.shade200,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomFullButton(
                        radios: 23,
                        text: 'Apply Filter',
                        response: () {
                          if (formKey.currentState!.validate()) {
                            if (fromDate.isAfter(toDate)) {
                              customShowToast(
                                msg: "please select correct dates",
                              );
                            }
                            else
                              {
                                context.pop();
                              }
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
