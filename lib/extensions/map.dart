extension MapExtensions<K, V> on Map<K, V> {
  /// Check if all query parameters exist in map keys
  bool containsQueryParams(List<String> params) {
    var count = 0;
    final keys = this.keys.map((element) => element.toString().toLowerCase());
    for (var key in params) {
      if (keys.contains(key.toLowerCase())) {
        count++;
      }
    }
    return count == params.length;
  }

  /// Require to exist a key in map and return it's value
  V requireParameter(String key) {
    return entries
        .firstWhere((e) => e.key.toString().toLowerCase() == key.toLowerCase())
        .value;
  }

  V? optionalParameter(String key) {
    try {
      return requireParameter(key);
    } on StateError {
      return null;
    }
  }

  /// Sum number of occurrences in keys till [key]
  int sumTillKey(int key) {
    var count = 0;
    for (var element in keys) {
      if ((element as int) < key) {
        count++;
      }
    }
    return count;
  }
}
