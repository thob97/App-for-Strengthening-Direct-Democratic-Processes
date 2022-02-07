// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'package:json_annotation/json_annotation.dart';

part 'berlin_3.g.dart';

@JsonSerializable(explicitToJson: true)
class Berlin_3 {
  const Berlin_3({
    required this.id,
    required this.next_id,
    required this.reference_time_3_id,
    required this.quorum_id,
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

  factory Berlin_3.fromJson(Map<String, dynamic> json) =>
      _$Berlin_3FromJson(json);
  final int id;
  final int? next_id;
  final int reference_time_3_id;
  final int quorum_id;
  final int? signatures_collected;
  final int? signatures_valid;
  final int? signatures_counted;
  final int procedure_id;
  final String information;
  final DateTime? begin;
  final DateTime? end;
  final double progress;
  final bool completed;

  Map<String, dynamic> toJson() => _$Berlin_3ToJson(this);
}
