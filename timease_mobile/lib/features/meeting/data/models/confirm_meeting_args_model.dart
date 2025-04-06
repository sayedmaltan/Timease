import '../../../event/data/models/event_model.dart';

class ConfirmMeetingArgsModel {
  final EventModel eventModel;
  final String startTime;

  ConfirmMeetingArgsModel({required this.eventModel, required this.startTime});
}
