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
