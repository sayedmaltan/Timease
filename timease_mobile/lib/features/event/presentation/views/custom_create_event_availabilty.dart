import 'package:flutter/material.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/custom_create_event_availabilty_row.dart';

import '../../../../constants.dart';

class CustomCreateEventAvailability extends StatefulWidget {
  const CustomCreateEventAvailability({
    super.key,
    required this.days,
  });

  final List<String> days;

  @override
  State<CustomCreateEventAvailability> createState() => _CustomCreateEventAvailabilityState();
}

class _CustomCreateEventAvailabilityState extends State<CustomCreateEventAvailability> {
 List<bool> isUnavailable=List.filled(7, false);
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
                  startTimeController: TextEditingController(),
                  endTimeController: TextEditingController(),
                  isUnavailable:isUnavailable[index] ,
                  onRemove: () {
                    setState(() {
                      isUnavailable[index]=true;
                    });
                  },
                  onAdd:() {
                    setState(() {
                      isUnavailable[index]=false;
                    });
                  } ,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
