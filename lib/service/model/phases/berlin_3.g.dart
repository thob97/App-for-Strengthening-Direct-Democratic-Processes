// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berlin_3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Berlin_3 _$Berlin_3FromJson(Map<String, dynamic> json) => Berlin_3(
      id: json['id'] as int,
      next_id: json['next_id'] as int?,
      reference_time_3_id: json['reference_time_3_id'] as int,
      quorum_id: json['quorum_id'] as int,
      signatures_collected: json['signatures_collected'] as int?,
      signatures_valid: json['signatures_valid'] as int?,
      signatures_counted: json['signatures_counted'] as int?,
      procedure_id: json['procedure_id'] as int,
      information: json['information'] as String,
      begin: json['begin'] == null
          ? null
          : DateTime.parse(json['begin'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      progress: (json['progress'] as num).toDouble(),
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$Berlin_3ToJson(Berlin_3 instance) => <String, dynamic>{
      'id': instance.id,
      'next_id': instance.next_id,
      'reference_time_3_id': instance.reference_time_3_id,
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
