import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timease_mobile/constants.dart';
import 'package:timease_mobile/features/event/data/models/create_event_model.dart';
import 'package:timease_mobile/features/event/presentation/views/widgets/date_time_entry.dart';
import '../../../../../core/utils/styles.dart';

class DateSpecificHours extends StatefulWidget {
  const DateSpecificHours({
    super.key,
    required this.availabilitiesList,
  });

  final List<AvailabilitiesItemModel> availabilitiesList;

  @override
  State<DateSpecificHours> createState() => _DateSpecificHoursState();
}

class _DateSpecificHoursState extends State<DateSpecificHours> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.black54,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Date-specific hours",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Text(
                  "Adjust hours for specific days",
                  style: Styles.textStyle12.copyWith(
                    color: Color(0xFF5A6A3E),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                var result = await pickDateTimeRange(context);
                if (result != null) {
                  widget.availabilitiesList
                      .add(AvailabilitiesItemModel.fromJson(result));
                  setState(() {});
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: kPrimaryColor),
                ),
                backgroundColor: Colors.white,
                foregroundColor: kPrimaryColor,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              child: Text("+ Hours"),
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.availabilitiesList.length,
          itemBuilder: (context, index) => DateTimeEntry(
            date: DateFormat('MMMM dd, yyyy').format(DateTime.parse(widget.availabilitiesList[index].date.toString())),
            timeRange: "${widget.availabilitiesList[index].startTime} - ${widget.availabilitiesList[index].endTime}",
            onRemove: () {
              widget.availabilitiesList.removeAt(index);
              setState(() {

              });
            },
          ),
        ),
      ],
    );
  }
}
Future<Map<String, String?>?> pickDateTimeRange(context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(DateTime.now().year+1),
  );

  if (pickedDate == null) return null;

  TimeOfDay? pickedFromTime = await showTimePicker(
    helpText: ' Choose the starting time',
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (pickedFromTime == null) return null;

  TimeOfDay initialTime =
  TimeOfDay(hour: pickedFromTime.hour, minute: pickedFromTime.minute + 30);
  TimeOfDay? pickedToTime = await showTimePicker(
    hourLabelText: ' Choose the ending time',
    helpText: ' Choose the ending time',
    context: context,
    initialTime: initialTime,
  );
  if (pickedToTime == null) return null;

  List<String> dayNames = [
    'SUNDAY',
    'MONDAY',
    'TUESDAY',
    'WEDNESDAY',
    'THURSDAY',
    'FRIDAY',
    'SATURDAY'
  ];
  return {
    'dayOfWeek': dayNames[pickedDate.weekday],
    'date': DateFormat('yyyy-MM-dd').format(pickedDate),
    'startTime': DateFormat('HH:mm').format(DateTime(2025, 3, 10, pickedFromTime.hour, pickedFromTime.minute)),
    'endTime': DateFormat('HH:mm').format(DateTime(2025, 3, 10, pickedToTime.hour, pickedToTime.minute))
  };
}
