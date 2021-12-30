import 'package:flutter/material.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/types/json_converter/datetime_converter.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/types/tag.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assignment.g.dart';

/// Constructure of the Assignment Object
@JsonSerializable()
@DateTimeJsonConverter()
class Assignment {
  final int id;
  final String name;
  final String? description;
  final String author; // Author ID
  final List<int>? reminderTime;
  final Tag? tag;

  @JsonKey(name: "dueDate")
  final DateTime? dueDate;

  Assignment({
    required this.id,
    required this.name,
    required this.author,
    this.description,
    this.dueDate,
    this.reminderTime,
    this.tag,
  });

  Color getColor() {
    if (tag == null || tag!.color == null) {
      return const Color(0xFFF9F9F9);
    }
    return tag!.color as Color;
  }

  factory Assignment.fromJson(Map<String, dynamic> json) =>
      _$AssignmentFromJson(json);

  Map<String, dynamic> toJson() => _$AssignmentToJson(this);

  @override
  bool operator ==(Object other) {
    return other is Assignment && hashCode == other.hashCode;
  }

  @override
  int get hashCode => id + author.hashCode;
}
