// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_procedure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleProcedure _$SimpleProcedureFromJson(Map<String, dynamic> json) =>
    SimpleProcedure(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      description: json['description'] as String,
      process: json['process'] as String,
      success: $enumDecode(_$ProcedureSuccessEnumMap, json['success']),
      category: $enumDecode(_$ProcedureCategoryEnumMap, json['category']),
      lastCompletedPhase: json['phase'] as int,
      createDate: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      endDate:
          json['end'] == null ? null : DateTime.parse(json['end'] as String),
      carrier: json['carrier'] == null
          ? null
          : User.fromJson(json['carrier'] as Map<String, dynamic>),
      organisation: json['organisation'] == null
          ? null
          : Organisation.fromJson(json['organisation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SimpleProcedureToJson(SimpleProcedure instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'description': instance.description,
      'process': instance.process,
      'success': _$ProcedureSuccessEnumMap[instance.success],
      'category': _$ProcedureCategoryEnumMap[instance.category],
      'phase': instance.lastCompletedPhase,
      'created': instance.createDate?.toIso8601String(),
      'end': instance.endDate?.toIso8601String(),
      'carrier': instance.carrier?.toJson(),
      'organisation': instance.organisation?.toJson(),
    };

const _$ProcedureSuccessEnumMap = {
  ProcedureSuccess.running: 'A_0',
  ProcedureSuccess.success: 'A_1',
  ProcedureSuccess.noSuccess: 'A_2',
  ProcedureSuccess.partialSuccess: 'A_3',
};

const _$ProcedureCategoryEnumMap = {
  ProcedureCategory.unknown: 'A_0',
  ProcedureCategory.educationAndCulture: 'A_1',
  ProcedureCategory.demokratie_stateorganisation_domesticPolitics: 'A_2',
  ProcedureCategory.economy: 'A_3',
  ProcedureCategory.social: 'A_4',
  ProcedureCategory.health_Enviromentprotection_Consumerprotection: 'A_5',
  ProcedureCategory.traffic: 'A_6',
  ProcedureCategory.miscellaneous: 'A_7',
};
