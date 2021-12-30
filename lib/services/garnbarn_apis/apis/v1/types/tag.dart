import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

class ColorJsonConverter implements JsonConverter<Color?, String> {
  const ColorJsonConverter();

  @override
  Color fromJson(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) {
      buffer.write('ff');
    }
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  @override
  String toJson(Color? object) {
    if (object == null) {
      return "";
    }
    return '#' +
        object.alpha.toRadixString(16).padLeft(2, '0') +
        object.red.toRadixString(16).padLeft(2, '0') +
        object.green.toRadixString(16).padLeft(2, '0') +
        object.blue.toRadixString(16).padLeft(2, '0');
  }
}

/// Constructure of the Tag Object.
@JsonSerializable()
@ColorJsonConverter()
class Tag {
  final int id;
  final String name;
  final String author;
  final List<int>? reminderTime;
  final List<String>? subscriber;
  final String? secretKeyTotp;

  @JsonKey(
    name: "color",
  )
  final Color? color;

  Tag({
    required this.id,
    required this.name,
    required this.author,
    this.color,
    this.reminderTime,
    this.subscriber,
    this.secretKeyTotp,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}
