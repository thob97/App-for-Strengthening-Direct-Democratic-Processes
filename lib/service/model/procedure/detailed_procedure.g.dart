// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_procedure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailedProcedure _$DetailedProcedureFromJson(Map<String, dynamic> json) =>
    DetailedProcedure(
      id: json['id'] as String,
      documents: (json['documentSet'] as List<dynamic>)
          .map((e) => Document.fromJson(e as Map<String, dynamic>))
          .toList(),
      organisation: json['organisation'] == null
          ? null
          : Organisation.fromJson(json['organisation'] as Map<String, dynamic>),
      process: json['process'] as String,
      category: $enumDecode(_$ProcedureCategoryEnumMap, json['category']),
      success: $enumDecode(_$ProcedureSuccessEnumMap, json['success']),
      outcomeReason: json['outcomeReason'] as String,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      lastChanged: json['lastChanged'] == null
          ? null
          : DateTime.parse(json['lastChanged'] as String),
      facebook: json['facebook'] as String?,
      twitter: json['twitter'] as String?,
      instagram: json['instagram'] as String?,
      whatsapp: json['whatsapp'] as String?,
      website: json['website'] as String?,
      appointments: (json['appointmentSet'] as List<dynamic>)
          .map((e) => Appointment.fromJson(e as Map<String, dynamic>))
          .toList(),
      berlin1: json['berlin1'] == null
          ? null
          : Berlin1.fromJson(json['berlin1'] as Map<String, dynamic>),
      berlin2: json['berlin2'] == null
          ? null
          : Berlin2.fromJson(json['berlin2'] as Map<String, dynamic>),
      berlin3: json['berlin3'] == null
          ? null
          : Berlin3.fromJson(json['berlin3'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailedProcedureToJson(DetailedProcedure instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appointmentSet': instance.appointments.map((e) => e.toJson()).toList(),
      'documentSet': instance.documents.map((e) => e.toJson()).toList(),
      'organisation': instance.organisation?.toJson(),
      'process': instance.process,
      'category': _$ProcedureCategoryEnumMap[instance.category],
      'success': _$ProcedureSuccessEnumMap[instance.success],
      'outcomeReason': instance.outcomeReason,
      'created': instance.created?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'lastChanged': instance.lastChanged?.toIso8601String(),
      'facebook': instance.facebook,
      'twitter': instance.twitter,
      'instagram': instance.instagram,
      'whatsapp': instance.whatsapp,
      'website': instance.website,
      'berlin1': instance.berlin1?.toJson(),
      'berlin2': instance.berlin2?.toJson(),
      'berlin3': instance.berlin3?.toJson(),
    };

const _$ProcedureCategoryEnumMap = {
  ProcedureCategory.unknown: 0,
  ProcedureCategory.educationAndCulture: 1,
  ProcedureCategory.demokratie_stateorganisation_domesticPolitics: 2,
  ProcedureCategory.economy: 3,
  ProcedureCategory.social: 4,
  ProcedureCategory.health_Enviromentprotection_Consumerprotection: 5,
  ProcedureCategory.traffic: 6,
  ProcedureCategory.miscellaneous: 7,
};

const _$ProcedureSuccessEnumMap = {
  ProcedureSuccess.running: 0,
  ProcedureSuccess.success: 1,
  ProcedureSuccess.noSuccess: 2,
  ProcedureSuccess.partialSuccess: 3,
};
