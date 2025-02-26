import '../../../features/event/data/models/event_model.dart';

List<Availabilities> sortAvailabilitiesByDay(List<Availabilities> availabilitiesList) {
  List<Availabilities> completeList = fillMissingDays(availabilitiesList);

  Map<String, int> weekOrder = {
    "SUNDAY": 0,
    "MONDAY": 1,
    "TUESDAY": 2,
    "WEDNESDAY": 3,
    "THURSDAY": 4,
    "FRIDAY": 5,
    "SATURDAY": 6
  };

  completeList.sort((a, b) {
    // Check if the day is unavailable, put those at the end
    if (a.startTime == "Unavailable" && b.startTime != "Unavailable") {
      return 1; // a goes to the end
    }
    if (a.startTime != "Unavailable" && b.startTime == "Unavailable") {
      return -1; // b goes to the end
    }

    // Otherwise, sort by the day of the week
    return weekOrder[a.dayOfWeek]!.compareTo(weekOrder[b.dayOfWeek]!);
  });

  return completeList;
}

// Function to ensure all 7 days exist in the list
List<Availabilities> fillMissingDays(List<Availabilities> availabilitiesList) {
  Set<String?> existingDays = availabilitiesList.map((e) => e.dayOfWeek).toSet();
  List<String> allDays = ["SUNDAY", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY"];

  // Get the first available ID from the list (for the missing days)
  String? defaultId = availabilitiesList.isNotEmpty ? availabilitiesList[0].id : "default-id";

  List<Availabilities> completeList = List.from(availabilitiesList);

  for (String day in allDays) {
    if (!existingDays.contains(day)) {
      completeList.add(Availabilities(
        id: defaultId, // Use the existing ID from an available day
        dayOfWeek: day,
        startTime: "Unavailable",
        endTime: "Unavailable",
      ));
    }
  }

  return completeList;
}
