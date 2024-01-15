extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  bool get isValidMobileOrEmail {
    if (this.contains('@')) {
      return this.isValidEmail;
    } else {
      return this.isValidMobile;
    }
  }

  bool get isValidMobile {
    final regex = RegExp(r'^\+?[0-9]+$'); // accepts both +989... and 09...
    return regex.hasMatch(this);
  }

  bool get isValidEmail {
    final regex = RegExp(r'^.+@.+(\..+)+$'); // keeping it simple for brevity
    return regex.hasMatch(this);
  }

  bool get isBlank => this.trim() == '';
}

extension StringNullableExtensions on String? {
  bool get isNullOrEmpty => this == null || this == '';

  bool get isNullOrBlank => this == null || this?.trim() == '';

  // Convert string farsi & arabic number to double
  double toDouble() {
    var input = this?.replaceAll(',', '.') ?? '0';
    final otherNumbers = {
      // arabic
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
      // farsi
      '۰': '0',
      '۱': '1',
      '۲': '2',
      '۳': '3',
      '۴': '4',
      '۵': '5',
      '۶': '6',
      '۷': '7',
      '۸': '8',
      '۹': '9',
    };
    otherNumbers.forEach((key, value) {
      input = input.replaceAll(key, value);
    });
    return double.tryParse(input) ?? 0.0;
  }
}
