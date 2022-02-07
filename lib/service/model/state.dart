// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'state.g.dart';

@JsonSerializable()
class State {
  const State({
    required this.id,
    required this.name,
    required this.contact_id,
    required this.first_phase_type,
  });

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  final int id;
  final String name;
  final int? contact_id;
  final PhaseType first_phase_type;

  Map<String, dynamic> toJson() => _$StateToJson(this);
}

enum PhaseType { berlin_0, berlin_1, berlin_3 }
