// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferenceTime _$ReferenceTimeFromJson(Map<String, dynamic> json) =>
    ReferenceTime(
      id: json['id'] as int,
      value: Duration(microseconds: json['value'] as int),
      valid_from: DateTime.parse(json['valid_from'] as String),
    );

Map<String, dynamic> _$ReferenceTimeToJson(ReferenceTime instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value.inMicroseconds,
      'valid_from': instance.valid_from.toIso8601String(),
    };
