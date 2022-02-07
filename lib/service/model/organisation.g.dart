// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organisation _$OrganisationFromJson(Map<String, dynamic> json) => Organisation(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      admin_id: json['admin_id'] as int,
      contact_id: json['contact_id'] as int,
    );

Map<String, dynamic> _$OrganisationToJson(Organisation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'admin_id': instance.admin_id,
      'contact_id': instance.contact_id,
    };
