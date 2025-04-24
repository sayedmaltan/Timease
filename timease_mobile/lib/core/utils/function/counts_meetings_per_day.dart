
import '../../../features/meeting/data/models/get_user_meetings_model.dart';

Map<String, int> countMeetingsPerDay(List<Meetings> meetings) {
 meetings=sortMeetingsList(meetings);

  Map<String, int> meetingsCountPerDay = {};

  for (var meeting in meetings) {
    final date = meeting.date;
    meetingsCountPerDay[date!] = (meetingsCountPerDay[date] ?? 0) + 1;
  }
  return meetingsCountPerDay;
}

List<Meetings> sortMeetingsList(List<Meetings> meetings) {
  meetings.sort((a, b) {
    final dateTimeA = DateTime.parse('${a.date} ${a.startTime}');
    final dateTimeB = DateTime.parse('${b.date} ${b.startTime}');
    return dateTimeA.compareTo(dateTimeB);
  });
  return meetings;
}

List<Meetings> getSelectedMeetings({required List<Meetings> meetings,required DateTime selectedDate}) {
  String date = selectedDate.toIso8601String().split('T')[0];
  List<Meetings> newList=[];
  for (var element in meetings) {
    if(element.date==date)
      {
        newList.add(element);
      }
  }
  return newList;
}