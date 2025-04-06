import 'package:intl/intl.dart';

abstract class DatesConverter {

  static String convert12hrTo24({required String time12Hr}) {
    return DateFormat('HH:mm:ss').format(DateFormat('hh:mm a').parse(time12Hr));
  }

  static String convert24hrTo12({required String time24Hr}) {
    return DateFormat('hh:mm a').format(DateFormat('HH:mm:ss').parse(time24Hr));
  }

  // Method to convert date format from 'April 6,2025' to '2025-04-06'
  static String convertDateFormat({required String date}) {
    return DateFormat('yyyy-MM-dd').format(DateFormat('MMMM d, yyyy').parse(date));
  }
}
