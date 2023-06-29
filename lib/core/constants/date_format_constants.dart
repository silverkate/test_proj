import 'package:test_proj/localization/index.dart';

class DateFormatUtil {
  static DateFormat defaultDateFormat = DateFormat('EE MM/dd/yyyy', 'en');
  static DateFormat defaultTimeFormat = DateFormat('hh:mm a', 'en');
  static DateFormat fullDateFormat = DateFormat('EE, MM/dd/yyyy hh:mm a', 'en');
}
