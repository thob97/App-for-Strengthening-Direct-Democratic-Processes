// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      begin: DateTime.parse(json['begin'] as String),
      end: DateTime.parse(json['end'] as String),
      procedure_id: json['procedure_id'] as int,
      address_id: json['address_id'] as int?,
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'begin': instance.begin.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'procedure_id': instance.procedure_id,
      'address_id': instance.address_id,
    };
