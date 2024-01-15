extension NumberExtensions on num {
  /// get precision part of the number
  /// eg. 70.000 will be 0, 70.100 will be 100
  int precision({int fractionDigits = 3}) {
    final precisionPart = toStringAsFixed(3).split('.')[1];
    final realPrecision = int.parse(precisionPart);
    return realPrecision;
  }

  /// add precision to the number
  /// 70.0 + 100 will be 70.100, 70.0 + 0 will be 70.0
  double plusPrecision(num? precision) {
    final precisionPart = precision ?? 0;
    final real = truncate();
    return double.parse('$real.$precisionPart');
  }

  /// get precision of [number] and add to this
  double plusPrecisionOf(double? number) {
    final precisionPart = number?.precision() ?? 0;
    final real = truncate();
    return double.parse('$real.$precisionPart');
  }

  /// To string without precision if it is zero.
  /// Eg. 17, 17.3
  String toStringAsFixedNoZeroPrecision({int fractionDigits = 1}) {
    int precision = this.precision();
    if (precision == 0) {
      return truncate().toString();
    } else {
      return toStringAsFixed(fractionDigits);
    }
  }

  /// Eg. 17.455555 will be 17.45
  double toPrecision(int n) => double.parse(toStringAsFixed(n));

  /// To string with leading zero.
  /// Eg. 08, 03 for numbers less than 10
  String get toLeadingZero => this < 10 ? '0${toString()}' : toString();

  int toMin() {
    return this ~/ 60;
  }

  double toSec() {
    return this % 60;
  }

  /// second time to hour:min:second format or min:second
  String intToTimeLeft() {
    String getParsedTime(String time) {
      if (time.length <= 1) return "0$time";
      return time;
    }

    int hour = this ~/ 3600;

    String parsedTime = '';
    if (hour > 0) {
      int min = ((this - hour * 3600)) ~/ 60;
      num sec = this - (hour * 3600) - (min * 60);
      parsedTime = "${getParsedTime(sec.toString())} : ${getParsedTime(min.toString())} : ${getParsedTime(hour.toString())}";
    } else {
      int min = this ~/ 60;
      num sec = this % 60;
      parsedTime =
          "${getParsedTime(sec.toString())} : ${getParsedTime(min.toString())}";
    }

    return parsedTime;
  }
}
