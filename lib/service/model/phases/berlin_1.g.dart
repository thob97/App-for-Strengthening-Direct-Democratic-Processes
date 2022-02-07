// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berlin_1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Berlin_1 _$Berlin_1FromJson(Map<String, dynamic> json) => Berlin_1(
      id: json['id'] as int,
      reference_time_0_id: json['reference_time_0_id'] as int,
      reference_time_1a_id: json['reference_time_1a_id'] as int,
      quorum_id: json['quorum_id'] as int,
      reference_time_1b_id: json['reference_time_1b_id'] as int,
      costs_estimated: (json['costs_estimated'] as num?)?.toDouble(),
      costs_own_estimated: (json['costs_own_estimated'] as num?)?.toDouble(),
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

Map<String, dynamic> _$Berlin_1ToJson(Berlin_1 instance) => <String, dynamic>{
      'id': instance.id,
      'reference_time_0_id': instance.reference_time_0_id,
      'reference_time_1a_id': instance.reference_time_1a_id,
      'reference_time_1b_id': instance.reference_time_1b_id,
      'quorum_id': instance.quorum_id,
      'costs_estimated': instance.costs_estimated,
      'costs_own_estimated': instance.costs_own_estimated,
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
