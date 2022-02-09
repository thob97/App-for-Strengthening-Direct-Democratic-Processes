// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procedure_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcedureSubscription _$ProcedureSubscriptionFromJson(
  Map<String, dynamic> json,
) =>
    ProcedureSubscription(
      id: json['id'] as int,
      extendeduser_id: json['extendeduser_id'] as int,
      procedure_id: json['procedure_id'] as int,
    );

Map<String, dynamic> _$ProcedureSubscriptionToJson(
  ProcedureSubscription instance,
) =>
    <String, dynamic>{
      'id': instance.id,
      'extendeduser_id': instance.extendeduser_id,
      'procedure_id': instance.procedure_id,
    };
