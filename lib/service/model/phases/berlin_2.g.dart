// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berlin_2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Berlin_2 _$Berlin_2FromJson(Map<String, dynamic> json) {
  return Berlin_2(
    id: json['id'] as int,
    next_id: json['next_id'] as int?,
    reference_time_2a_id: json['reference_time_2a_id'] as int,
    reference_time_2b_id: json['reference_time_2b_id'] as int,
    quorum_id: json['quorum_id'] as int,
    signatures_collected: json['signatures_collected'] as int?,
    signatures_valid: json['signatures_valid'] as int?,
    signatures_counted: json['signatures_counted'] as int?,
    procedure_id: json['procedure_id'] as int,
    information: json['information'] as String,
    begin:
        json['begin'] == null ? null : DateTime.parse(json['begin'] as String),
    end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
    progress: (json['progress'] as num).toDouble(),
    completed: json['completed'] as bool,
  );
}

Map<String, dynamic> _$Berlin_2ToJson(Berlin_2 instance) => <String, dynamic>{
      'id': instance.id,
      'next_id': instance.next_id,
      'reference_time_2a_id': instance.reference_time_2a_id,
      'reference_time_2b_id': instance.reference_time_2b_id,
      'quorum_id': instance.quorum_id,
      'signatures_collected': instance.signatures_collected,
      'signatures_valid': instance.signatures_valid,
      'signatures_counted': instance.signatures_counted,
      'procedure_id': instance.procedure_id,
      'information': instance.information,
      'begin': instance.begin?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'progress': instance.progress,
      'completed': instance.completed,
    };
