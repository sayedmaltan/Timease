import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/utils/dates_converter.dart';
import 'package:timease_mobile/core/widgets/custom_loading_button.dart';
import 'package:timease_mobile/features/meeting/presentation/manger/create_meeting_cubit/create_meeting_cubit.dart';
import '../../../../../core/utils/function/custom_toast.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_full_button.dart';
import '../../../data/models/confirm_meeting_args_model.dart';
import '../../manger/create_meeting_cubit/create_meeting_state.dart';
import '../../manger/meeting_cubit/meeting_cubit.dart';
import 'custom_confirm_meeting_build_attendee.dart';

class ConfirmMeetingViewBody extends StatelessWidget {
  const ConfirmMeetingViewBody({
    super.key,
    required this.confirmMeetingArgsModel,
    required this.dayOfWeak,
    required this.date,
    required this.endTime12hr,
    required this.hostName,
  });

  final ConfirmMeetingArgsModel confirmMeetingArgsModel;
  final String dayOfWeak;
  final String date;
  final String endTime12hr;
  final String hostName;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateMeetingCubit, CreateMeetingState>(
      builder: (context, state) {
        CreateMeetingCubit createMeetingCubit = CreateMeetingCubit.get(context);
        return Column(
          children: [
            Divider(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Meeting details",
                      style: Styles.textStyleBlack.copyWith(fontSize: 16),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                            "${confirmMeetingArgsModel.eventModel.title}, ${confirmMeetingArgsModel.eventModel.duration} mins"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "$dayOfWeak, $date ${confirmMeetingArgsModel.startTime} - $endTime12hr\n(Africa/Cairo)",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Attendees",
                      style: Styles.textStyleBlack.copyWith(fontSize: 16),
                    ),
                    CustomConfirmMeetingBuildAttendee(
                      name: hostName,
                      isHost: true,
                    ),
                    Spacer(),
                    state is CreateMeetingLoadingState
                        ? CustomLoadingButton()
                        : CustomFullButton(
                            text: "Schedule meeting",
                            onPressed: () async {
                              await createMeetingCubit.createMeeting(
                                availabilityId:
                                    createMeetingCubit.availabilityId!,
                                date: DatesConverter.convertDateFormat1(
                                    date: date),
                                startTime: DatesConverter.convert12hrTo24(
                                    time12Hr:
                                        confirmMeetingArgsModel.startTime),
                                endTime: DatesConverter.convert12hrTo24(
                                    time12Hr: endTime12hr),
                              );
                            },
                            height: 50,
                          ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      listener: (context, state) {
        if (state is CreateMeetingSuccessState) {
          customShowToast(msg: 'Meeting created successfully');
          context.pop();
          context.pop();
          context.pop();
          MeetingCubit meetingCubit = MeetingCubit.get(context);
          meetingCubit.getUserMeetingsList();
        } else if (state is CreateMeetingFailureState) {
          customShowToast(msg: state.errMessage);
        }
      },
    );
  }
}
