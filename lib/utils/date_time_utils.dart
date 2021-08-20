import 'package:intl/intl.dart';

class DateTimeUtils {

  static const String EEEE_dd_MMM_yyyy = "EEEE dd MMM, yyyy";
  static const String dd_MM_yy = "dd/MM/yy";

  static String detailScreenTimeStampConvert(int timestamp) {
    return _convertTimeStamp(timestamp, EEEE_dd_MMM_yyyy);
  }

  static String listItemTimeStampConvert(int timestamp) {
    return _convertTimeStamp(timestamp, dd_MM_yy);
  }

  static String _convertTimeStamp(int timestamp, String format) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var formattedDate = DateFormat(format).format(dateTime);
    return formattedDate;
  }
}