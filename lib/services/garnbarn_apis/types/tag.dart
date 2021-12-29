import 'package:flutter/material.dart';

/// Constructure of the Tag Object.
class Tag {
  final int id;
  final String name;
  final String author;
  final Color? color;
  final List<int>? reminderTime;
  final List<String>? subscriber;
  final String? secretKeyTotp;

  Tag({
    required this.id,
    required this.name,
    required this.author,
    this.color,
    this.reminderTime,
    this.subscriber,
    this.secretKeyTotp,
  });
}
