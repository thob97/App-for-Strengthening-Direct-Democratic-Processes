// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procedure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Procedure _$ProcedureFromJson(Map<String, dynamic> json) {
  return Procedure(
    id: json['id'] as int,
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
    description: json['description'] as String,
    state_id: json['state_id'] as int,
    organisation_id: json['organisation_id'] as int?,
    process: json['process'] as String,
    success: $enumDecode(_$SuccessEnumMap, json['success']),
    outcome_reason: json['outcome_reason'] as String,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
    last_changed: json['last_changed'] == null
        ? null
        : DateTime.parse(json['last_changed'] as String),
    carrier_id: json['carrier_id'] as int?,
    social_media_id: json['social_media_id'] as int?,
    visible: json['visible'] as bool,
  );
}

Map<String, dynamic> _$ProcedureToJson(Procedure instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'description': instance.description,
      'state_id': instance.state_id,
      'organisation_id': instance.organisation_id,
      'process': instance.process,
      'success': _$SuccessEnumMap[instance.success],
      'outcome_reason': instance.outcome_reason,
      'created': instance.created?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'last_changed': instance.last_changed?.toIso8601String(),
      'carrier_id': instance.carrier_id,
      'social_media_id': instance.social_media_id,
      'visible': instance.visible,
    };

const _$SuccessEnumMap = {
  Success.running: 'running',
  Success.success: 'success',
  Success.no_success: 'no_success',
};
