// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

State _$StateFromJson(Map<String, dynamic> json) => State(
      id: json['id'] as String,
      name: json['name'] as String,
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
      procedures: (json['procedureSet'] as List<dynamic>)
          .map((e) => SimpleProcedure.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StateToJson(State instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'contact': instance.contact,
      'procedureSet': instance.procedures,
    };
