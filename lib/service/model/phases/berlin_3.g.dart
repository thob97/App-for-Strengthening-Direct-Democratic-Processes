// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berlin_3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Berlin3 _$Berlin3FromJson(Map<String, dynamic> json) => Berlin3(
      id: json['id'] as int,
      voteDate: json['voteDate'] == null
          ? null
          : DateTime.parse(json['voteDate'] as String),
      votesCounted: json['votesCounted'] as int?,
      votesValid: json['votesValid'] as int?,
      votesYes: json['votesYes'] as int?,
      information: json['information'] as String,
      begin: json['begin'] == null
          ? null
          : DateTime.parse(json['begin'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      progress: (json['progress'] as num).toDouble(),
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$Berlin3ToJson(Berlin3 instance) => <String, dynamic>{
      'id': instance.id,
      'voteDate': instance.voteDate?.toIso8601String(),
      'votesCounted': instance.votesCounted,
      'votesValid': instance.votesValid,
      'votesYes': instance.votesYes,
      'information': instance.information,
      'begin': instance.begin?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'progress': instance.progress,
      'completed': instance.completed,
    };
