import 'package:intl/intl.dart';

class Helper {
  Helper._();

  static DateTime StringToDateTimeObject(String date, schema) {
    var inputFormat = DateFormat(schema, 'en');
    var inputDate = inputFormat.parse(date);
    return inputDate;
  }

  static String cleanHTTP(String url) {
    if (!url.startsWith('www.') && !url.startsWith('https://')) {
      url = 'www.' + url;
    }
    if (!url.startsWith('https://')) {
      url = 'https://' + url;
    }

    return url;
  }
}
