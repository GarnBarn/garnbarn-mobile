// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      id: json['id'] as int,
      name: json['name'] as String,
      author: json['author'] as String,
      color: const ColorJsonConverter().fromJson(json['color'] as String?),
      reminderTime: (json['reminderTime'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      subscriber: (json['subscriber'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      secretKeyTotp: json['secretKeyTotp'] as String?,
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'reminderTime': instance.reminderTime,
      'subscriber': instance.subscriber,
      'secretKeyTotp': instance.secretKeyTotp,
      'color': const ColorJsonConverter().toJson(instance.color),
    };
