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
        child: Column(
          children: [
            Expanded(
              child: CustomAvailableTimeRow(
                  day: availabilitiesList[0].dayOfWeek!,
                  time: availabilitiesList[0]
                              .startTime!
                              .compareTo('Unavailable') ==
                          0
                      ? 'Unavailable'
                      : '${availabilitiesList[0].startTime!.substring(0, 5)}-${availabilitiesList[0].endTime!.substring(0, 5)}'),
            ),
            Divider(),
            Expanded(
                child: CustomAvailableTimeRow(
                    day: availabilitiesList[1].dayOfWeek!,
                    time: availabilitiesList[1]
                                .startTime!
                                .compareTo('Unavailable') ==
                            0
                        ? 'Unavailable'
                        : '${availabilitiesList[1].startTime!.substring(0, 5)}-${availabilitiesList[1].endTime!.substring(0, 5)}')),
            Divider(),
            Expanded(
                child: CustomAvailableTimeRow(
                    day: availabilitiesList[2].dayOfWeek!,
                    time: availabilitiesList[2]
                                .startTime!
                                .compareTo('Unavailable') ==
                            0
                        ? 'Unavailable'
                        : '${availabilitiesList[2].startTime!.substring(0, 5)}-${availabilitiesList[2].endTime!.substring(0, 5)}')),
            Divider(),
            Expanded(
                child: CustomAvailableTimeRow(
                    day: availabilitiesList[3].dayOfWeek!,
                    time: availabilitiesList[3]
                                .startTime!
                                .compareTo('Unavailable') ==
                            0
                        ? 'Unavailable'
                        : '${availabilitiesList[3].startTime!.substring(0, 5)}-${availabilitiesList[3].endTime!.substring(0, 5)}')),
            Divider(),
            Expanded(
                child: CustomAvailableTimeRow(
                    day: availabilitiesList[4].dayOfWeek!,
                    time: availabilitiesList[4]
                                .startTime!
                                .compareTo('Unavailable') ==
                            0
                        ? 'Unavailable'
                        : '${availabilitiesList[4].startTime!.substring(0, 5)}-${availabilitiesList[4].endTime!.substring(0, 5)}')),
            Divider(),
            Expanded(
                child: CustomAvailableTimeRow(
                    day: availabilitiesList[5].dayOfWeek!,
                    time: availabilitiesList[5]
                                .startTime!
                                .compareTo('Unavailable') ==
                            0
                        ? 'Unavailable'
                        : '${availabilitiesList[5].startTime!.substring(0, 5)}-${availabilitiesList[5].endTime!.substring(0, 5)}')),
            Divider(),
            Expanded(
              child: CustomAvailableTimeRow(
                  day: availabilitiesList[6].dayOfWeek!,
                  time: availabilitiesList[6]
                              .startTime!
                              .compareTo('Unavailable') ==
                          0
                      ? 'Unavailable'
                      : '${availabilitiesList[6].startTime!.substring(0, 5)}-${availabilitiesList[6].endTime!.substring(0, 5)}'),
            ),
          ],
        ),
      ),
    );
  }
}
