import 'package:flutter/material.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/types/tag.dart';

/// Constructure of the Assignment Object
class Assignment {
  final int id;
  final String name;
  final String? description;
  final DateTime? dueDate;
  final String author; // Author ID
  final List<int>? reminderTime;
  final Tag? tag;

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
}
