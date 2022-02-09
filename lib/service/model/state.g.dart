// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

State _$StateFromJson(Map<String, dynamic> json) => State(
      id: json['id'] as int,
      name: json['name'] as String,
      contact_id: json['contact_id'] as int?,
      first_phase_type:
          $enumDecode(_$PhaseTypeEnumMap, json['first_phase_type']),
    );

Map<String, dynamic> _$StateToJson(State instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'contact_id': instance.contact_id,
      'first_phase_type': _$PhaseTypeEnumMap[instance.first_phase_type],
    };

const _$PhaseTypeEnumMap = {
  PhaseType.berlin_0: 'berlin_0',
  PhaseType.berlin_1: 'berlin_1',
  PhaseType.berlin_3: 'berlin_3',
};
