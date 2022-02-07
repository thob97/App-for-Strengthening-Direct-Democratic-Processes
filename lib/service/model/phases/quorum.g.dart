// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quorum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quorum _$QuorumFromJson(Map<String, dynamic> json) => Quorum(
      id: json['id'] as int,
      value: json['value'] as int,
      valid_from: DateTime.parse(json['valid_from'] as String),
    );

Map<String, dynamic> _$QuorumToJson(Quorum instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'valid_from': instance.valid_from.toIso8601String(),
    };
