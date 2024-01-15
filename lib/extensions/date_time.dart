import 'package:intl/intl.dart';
import 'package:logifan/extensions/object.dart';

extension DateTimeExtensions on DateTime {
  /// Current datetime is at same hour and minute of other datetime
  /// [minuteOffset] indicates amount of minutes to ignore
  bool isAtSameHourMinute(DateTime other, {int minuteOffset = 0}) {
    return year == other.year &&
        month == other.month &&
        day == other.day &&
        hour == other.hour &&
        (minute == other.minute ||
            (minute > other.minute - minuteOffset &&
                minute < other.minute + minuteOffset));
  }

  /// Current datetime is at same Year/Month/Day of other datetime
  bool isAtSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// time in [Duration] format
  Duration get time => Duration(hours: hour, minutes: minute, seconds: second);

  /// local time in [Duration] format
  Duration get timeLocal {
    return toLocal().let(
          (it) => Duration(hours: it.hour, minutes: it.minute, seconds: it.second),
        );
  }

  /// Eg. 2022-01-15
  String toStringShort() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}
