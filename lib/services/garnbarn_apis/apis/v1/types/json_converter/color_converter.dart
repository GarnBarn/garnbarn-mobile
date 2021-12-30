import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class ColorJsonConverter implements JsonConverter<Color?, String?> {
  const ColorJsonConverter();

  @override
  Color? fromJson(String? hex) {
    if (hex == null) {
      return null;
    }
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) {
      buffer.write('ff');
    }
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  @override
  String? toJson(Color? object) {
    if (object == null) {
      return null;
    }
    return '#' +
        object.alpha.toRadixString(16).padLeft(2, '0') +
        object.red.toRadixString(16).padLeft(2, '0') +
        object.green.toRadixString(16).padLeft(2, '0') +
        object.blue.toRadixString(16).padLeft(2, '0');
  }
}
