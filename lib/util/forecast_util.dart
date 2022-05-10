import 'package:intl/intl.dart';
import 'package:weather_forecast/model/weather_model.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat("EEE, d MMM, y").format(dateTime);
  }

  static String formatTime(DateTime dateTime) {
    return ("h:mm a").toString();
  }
}
