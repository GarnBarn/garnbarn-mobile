import 'package:flutter/material.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/types/json_converter/color_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

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

  @override
  bool operator ==(Object other) {
    return other is Tag && id == other.id;
  }

  @override
  int get hashCode => id + name.hashCode;
}
