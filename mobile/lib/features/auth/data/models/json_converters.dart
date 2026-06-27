String stringFromJson(Object? value) => value?.toString() ?? '';

DateTime dateTimeFromJson(Object? value) {
  if (value == null) {
    return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
  }
  if (value is String) {
    return DateTime.parse(value);
  }
  return DateTime.parse(value.toString());
}

String dateTimeToJson(DateTime value) => value.toUtc().toIso8601String();
