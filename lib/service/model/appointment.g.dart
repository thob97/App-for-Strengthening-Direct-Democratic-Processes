// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      begin: json['begin'] == null
          ? null
          : DateTime.parse(json['begin'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'begin': instance.begin?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'address': instance.address,
    };
