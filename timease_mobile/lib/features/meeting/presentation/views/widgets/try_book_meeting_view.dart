import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timease_mobile/core/widgets/custom_shimmer_loading.dart';
import 'package:timease_mobile/features/event/presentation/manger/one_event_cubit/one_event_cubit.dart';
import 'package:timease_mobile/features/event/presentation/manger/one_event_cubit/one_event_state.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/function/custom_toast.dart';
import '../../../../event/presentation/views/widgets/custom_event_container.dart';
import '../../../../event/presentation/views/widgets/custom_your_text.dart';

class TryBookMeetingView extends StatefulWidget {
  const TryBookMeetingView({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<TryBookMeetingView> createState() => _TryBookMeetingViewState();
}

class _TryBookMeetingViewState extends State<TryBookMeetingView> {
  @override
  void initState() {
    super.initState();
    OneEventCubit oneEventCubit = OneEventCubit.get(context);
    oneEventCubit.getEventByEventId(eventId: widget.controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OneEventCubit, OneEventsState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                // CustomMeetingSearch(
                //   controller: controller,
                //   text: 'Enter event id',
                //   onChanged: (value) {
                //     oneEventCubit.getEventByEventId(eventId: value);
                //   },
                // ),
                CustomYourText(
                  text: 'BOOK EVENT HERE',
                ),
                if (state is GetOneEventSuccess)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomEventContainer(
                      isBooking: true,
                      eventModel: state.eventModel,
                      color: kPrimaryColor,
                    ),
                  )
                else if (state is GetOneEventLoading)
                  SizedBox(
                    height: 80,
                    child: CustomShimmerLoading(
                      itemCount: 1,
                    ),
                  )
                else if (state is GetOneEventFailure)
                  Center(child: Text('FAIL'))
                else
                  Center(child: Text('kkkkkkkkkkkkkkkkkkkkkkkkkk'))
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is GetOneEventFailure) {
          customShowToast(msg: 'Failed to find event. Please try again later.');
        }
      },
    );
  }
}
