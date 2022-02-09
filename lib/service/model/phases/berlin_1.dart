// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'package:json_annotation/json_annotation.dart';

part 'berlin_1.g.dart';

@JsonSerializable(explicitToJson: true)
class Berlin_1 {
  const Berlin_1({
    required this.id,
    required this.reference_time_0_id,
    required this.reference_time_1a_id,
    required this.reference_time_1b_id,
    required this.quorum_id,
    required this.costs_estimated,
    required this.costs_own_estimated,
    required this.signatures_collected,
    required this.signatures_valid,
    required this.signatures_counted,
    required this.procedure_id,
    required this.information,
    required this.begin,
    required this.end,
    required this.progress,
    required this.completed,
  });

  factory Berlin_1.fromJson(Map<String, dynamic> json) =>
      _$Berlin_1FromJson(json);
  final int id;
  final int reference_time_0_id;
  final int reference_time_1a_id;
  final int reference_time_1b_id;
  final int quorum_id;
  final double? costs_estimated;
  final double? costs_own_estimated;
  final int? signatures_collected;
  final int? signatures_valid;
  final int? signatures_counted;
  final int procedure_id;
  final String information;
  final DateTime? begin;
  final DateTime? end;
  final double progress;
  final bool completed;

  Map<String, dynamic> toJson() => _$Berlin_1ToJson(this);
}
