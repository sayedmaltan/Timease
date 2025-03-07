import 'package:flutter/material.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/core/utils/cash_helper.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_event_container.dart';
import '../../manger/event_cubit/user_events_cubit.dart';

class EventsList extends StatelessWidget {
  const EventsList({
    super.key,
    required this.eventsList,
  });
  final List<EventModel> eventsList;


  @override
  Widget build(BuildContext context) {
    UserEventsCubit userEventsCubit=UserEventsCubit.get(context);
    int counter=0;
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Dismissible(
          background: Container(
            color: Colors.red,
            child: Icon(Icons.delete,size: 30,),
          ),
          key: Key('$index'),

          onDismissed: (direction) {
            userEventsCubit.deleteUserEventsItem(userId: CashHelper.getData('userId'),eventId:eventsList[index].id ??'');
          },
          child: CustomEventContainer(
            eventModel: eventsList[index],
            color: eventsList.length>=index? colorsList[index]:colorsList[counter++],
          ),
        ),
      ),
      itemCount: eventsList.length,
    );
  }
}
