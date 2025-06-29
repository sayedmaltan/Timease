import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/utils/api_service.dart';
import 'package:timease_mobile/core/utils/service_locator.dart';
import 'package:timease_mobile/core/widgets/custom_full_button.dart';
import 'package:timease_mobile/core/widgets/custom_loading_button.dart';
import 'package:timease_mobile/features/authentication/presentation/views/widgets/custom_field_column.dart';
import 'package:timease_mobile/features/event/presentation/manger/broad_cast_cubit/broad_cast_cubit.dart';
import 'package:timease_mobile/features/event/presentation/manger/broad_cast_cubit/broad_cast_state.dart';
import 'custom_toast.dart';

void showBroadCastBottomSheet({
  required context,
  required String eventId,
}) {
  TextEditingController title = TextEditingController();
  TextEditingController message = TextEditingController();
  var formKey = GlobalKey<FormState>();
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return BlocProvider(
        create: (context) => BroadCastCubit(getIt.get<ApiService>()),
        child: BlocConsumer<BroadCastCubit, BroadCastState>(
          listener: (context, state) {
            if (state is BroadCastSuccess) {
              context.pop();
              customShowToast(msg: 'Successfully sent to users');
            } else if (state is BroadCastFailure) {
              customShowToast(msg: 'Could not deliver to users try later!');
            }
          },
          builder: (context, state) {
            BroadCastCubit broadCastCubit = BroadCastCubit.get(context);
            return Form(
              key: formKey,
              child: Padding(
                padding:  EdgeInsets.only(
                  bottom: MediaQuery.of(context)
                      .viewInsets
                      .bottom,
                  left: 16,
                  right: 16,
                  top: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 16),
                    CustomFieldColumn(
                      hintText: 'Enter a short title',
                      aboveHintText: 'Title',
                      controller: title,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 5),
                    CustomFieldColumn(
                      hintText: 'Type your message here',
                      aboveHintText: 'Message',
                      controller: message,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    state is BroadCastLoading
                        ? CustomLoadingButton()
                        : CustomFullButton(
                            text: "Send BroadCast",
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                broadCastCubit.sendBroadCast(
                                  eventId: eventId,
                                  title: title.text,
                                  message: message.text,
                                );
                              }
                            },
                            height: 50,
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
