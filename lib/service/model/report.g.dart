// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      id: json['id'] as int,
      procedure_id: json['procedure_id'] as int,
      triggered_by_id: json['triggered_by_id'] as int,
      created: DateTime.parse(json['created'] as String),
      category: $enumDecode(_$ReportCategoriesEnumMap, json['category']),
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'id': instance.id,
      'procedure_id': instance.procedure_id,
      'triggered_by_id': instance.triggered_by_id,
      'created': instance.created.toIso8601String(),
      'category': _$ReportCategoriesEnumMap[instance.category],
    };

const _$ReportCategoriesEnumMap = {
  ReportCategories.newR: 'newR',
  ReportCategories.reported: 'reported',
  ReportCategories.changed: 'changed',
};
