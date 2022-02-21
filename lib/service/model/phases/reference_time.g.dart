// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferenceTime _$ReferenceTimeFromJson(Map<String, dynamic> json) =>
    ReferenceTime(
      id: json['id'] as int,
      validFrom: DateTime.parse(json['validFrom'] as String),
    );

Map<String, dynamic> _$ReferenceTimeToJson(ReferenceTime instance) =>
    <String, dynamic>{
      'id': instance.id,
      'validFrom': instance.validFrom.toIso8601String(),
    };
