// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quorum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quorum _$QuorumFromJson(Map<String, dynamic> json) => Quorum(
      id: json['id'] as int,
      value: json['value'] as int,
      validFrom: DateTime.parse(json['validFrom'] as String),
    );

Map<String, dynamic> _$QuorumToJson(Quorum instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'validFrom': instance.validFrom.toIso8601String(),
    };
