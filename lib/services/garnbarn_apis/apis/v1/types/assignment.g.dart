// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Assignment _$AssignmentFromJson(Map<String, dynamic> json) => Assignment(
      id: json['id'] as int,
      name: json['name'] as String,
      author: json['author'] as String,
      description: json['description'] as String?,
      dueDate: const DateTimeJsonConverter().fromJson(json['dueDate'] as int?),
      reminderTime: (json['reminderTime'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      tag: json['tag'] == null
          ? null
          : Tag.fromJson(json['tag'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssignmentToJson(Assignment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'author': instance.author,
      'reminderTime': instance.reminderTime,
      'tag': instance.tag,
      'dueDate': const DateTimeJsonConverter().toJson(instance.dueDate),
    };
