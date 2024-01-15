extension ListNullableExtensions<E> on List<E>? {
  /// Check if value exist in list
  bool existWhere(bool Function(E element) test, [int start = 0]) {
    return this != null && this!.indexWhere((element) => test(element), start) != -1;
  }
}

extension ListExtensions<E> on List<E> {
  ///  Nearest index of the given [number],
  ///  eg. in 2,5,7,9 list nearest index to 6 is 1
  int nearestIndexOfValue(num number) {
    for (var i = 0; i < length; i++) {
      if (number < (this[i] as num)) {
        return i - 1;
      } else if (number == (this[i] as num)) {
        return i;
      }
    }
    return length - 1;
  }
}
