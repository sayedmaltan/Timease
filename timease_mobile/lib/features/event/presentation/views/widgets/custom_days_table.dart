import 'package:flutter/material.dart';
import 'package:timease_mobile/features/event/data/models/event_model.dart';
import '../../../../../constants.dart';
import 'custom_available_time_row.dart';

class CustomDaysTable extends StatelessWidget {
  const CustomDaysTable({
    super.key,
    required this.availabilitiesList,
  });

  final List<Availabilities> availabilitiesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 390,
        decoration: BoxDecoration(
          border: Border.all(color: kSecPrimaryColor.shade400),
        ),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 7,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 41,
              child: Center(
                child: CustomAvailableTimeRow(
                  day: availabilitiesList[index].dayOfWeek!,
                  time: availabilitiesList[index]
                              .startTime!
                              .compareTo('Unavailable') ==
                          0
                      ? 'Unavailable'
                      : '${convertTo12HourFormat(availabilitiesList[index].startTime!.substring(0, 5))}-${convertTo12HourFormat(availabilitiesList[index].endTime!.substring(0, 5))}',
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String convertTo12HourFormat(String time24) {
    List<String> parts = time24.split(':');
    int hour = int.parse(parts[0]);
    String minute = parts[1];

    String period = (hour >= 12) ? 'PM' : 'AM';
    int hour12 = (hour == 0) ? 12 : (hour > 12 ? hour - 12 : hour);

    return '$hour12:$minute $period';
  }
}
