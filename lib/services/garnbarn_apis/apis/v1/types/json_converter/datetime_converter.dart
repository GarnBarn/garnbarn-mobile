import 'package:json_annotation/json_annotation.dart';

class DateTimeJsonConverter implements JsonConverter<DateTime?, int?> {
  const DateTimeJsonConverter();

  @override
  DateTime? fromJson(int? json) {
    if (json == null) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(json);
  }

  @override
  int? toJson(DateTime? object) {
    if (object == null) {
      return null;
    }
    return object.millisecondsSinceEpoch;
  }
}
