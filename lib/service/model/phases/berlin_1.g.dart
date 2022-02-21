// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berlin_1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Berlin1 _$Berlin1FromJson(Map<String, dynamic> json) => Berlin1(
      id: json['id'] as int,
      signaturesCollected: json['signaturesCollected'] as int?,
      signaturesValid: json['signaturesValid'] as int?,
      signaturesCounted: json['signaturesCounted'] as int?,
      information: json['information'] as String,
      begin: json['begin'] == null
          ? null
          : DateTime.parse(json['begin'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      progress: (json['progress'] as num).toDouble(),
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$Berlin1ToJson(Berlin1 instance) => <String, dynamic>{
      'id': instance.id,
      'signaturesCollected': instance.signaturesCollected,
      'signaturesValid': instance.signaturesValid,
      'signaturesCounted': instance.signaturesCounted,
      'information': instance.information,
      'begin': instance.begin?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'progress': instance.progress,
      'completed': instance.completed,
    };
