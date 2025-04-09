import '../../../features/event/data/models/event_model.dart';

DateTime getLastDate({required EventModel eventModel}) {
  DateTime lastDate = DateTime(2024, 04, 01);
  for (var element in eventModel.availabilities!) {
    if (DateTime.parse(element.date!).isAfter(lastDate)) {
      lastDate = DateTime.parse(element.date!);
    }
  }
  return lastDate;
}