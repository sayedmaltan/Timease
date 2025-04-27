import 'package:intl/intl.dart';

abstract class DatesConverter {
  static String convert12hrTo24({required String time12Hr}) {
    return DateFormat('HH:mm:ss').format(DateFormat('hh:mm a').parse(time12Hr));
  }

  static String convert24hrTo12({required String time24Hr}) {
    return DateFormat('hh:mm a').format(DateFormat('HH:mm:ss').parse(time24Hr));
  }

  // Method to convert date format from 'April 6,2025' to '2025-04-06'
  static String convertDateFormat1({required String date}) {
    return DateFormat('yyyy-MM-dd')
        .format(DateFormat('MMMM d, yyyy').parse(date));
  }

  static String convertDateFormat2({required String date}) {
    return DateFormat('MMMM d, yyyy')
        .format(DateFormat('yyyy-MM-dd').parse(date));
  }

  // Method to convert date format from '2025-04-06' to 'Monday April 6,2025'
  static String convertDateFormat3({required String date}) {
    DateTime dateTime = DateFormat('yyyy-MM-dd').parse(date);
    List<String> days = [
      '',
      'Monday ',
      'Tuesday ',
      "Wednesday ",
      "Thursday ",
      'Friday ',
      'Saturday ',
      'Sunday '
    ];
    int weekDay = dateTime.weekday;
    String dayWeek = days[weekDay];
    return dayWeek + (DateFormat('MMMM d, yyyy').format(dateTime));
  }
}
