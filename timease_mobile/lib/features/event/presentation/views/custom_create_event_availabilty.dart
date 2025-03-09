import 'package:flutter/material.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_availabilty_row.dart';
import '../../../../constants.dart';

class CustomCreateEventAvailability extends StatefulWidget {
  const CustomCreateEventAvailability({
    super.key,
    required this.days,
    required this.isUnavailable,
    required this.startTimeList,
    required this.endTimeList,
  });

  final List<bool> isUnavailable;
  final List<TextEditingController> startTimeList;
  final List<TextEditingController> endTimeList;
  final List<String> days;

  @override
  State<CustomCreateEventAvailability> createState() =>
      _CustomCreateEventAvailabilityState();
}

class _CustomCreateEventAvailabilityState
    extends State<CustomCreateEventAvailability> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: kSecPrimaryColor.shade100,
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          "Availability",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        tilePadding: EdgeInsets.only(left: 22, top: 9, right: 22),
        childrenPadding: EdgeInsets.only(left: 22, right: 22, top: 10),
        children: [
          SizedBox(
            height: 355,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 7,
              itemBuilder: (context, index) {
                return CustomCreateEventAvailabilityRow(
                  day: widget.days[index],
                  startTimeController: widget.startTimeList[index],
                  endTimeController: widget.endTimeList[index],
                  isUnavailable: widget.isUnavailable[index],
                  onRemove: () {
                    setState(() {
                      widget.isUnavailable[index] = true;
                    });
                  },
                  onAdd: () {
                    setState(() {
                      widget.isUnavailable[index] = false;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
