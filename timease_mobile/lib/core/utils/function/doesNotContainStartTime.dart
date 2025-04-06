import '../../../features/meeting/data/models/check_fully_booked_model.dart';

bool doesNotContainStartTime(CheckFullyBookedModel model, String targetTime) {
  return !(model.fullyBooked?.any((item) => item.startTime == targetTime) ?? false);
}
