// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'procedure.g.dart';

@JsonSerializable(explicitToJson: true)
class Procedure {
  const Procedure({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.state_id,
    required this.organisation_id,
    required this.process,
    required this.success,
    required this.outcome_reason,
    required this.created,
    required this.end,
    required this.last_changed,
    required this.carrier_id,
    required this.social_media_id,
    required this.visible,
  });

  factory Procedure.fromJson(Map<String, dynamic> json) =>
      _$ProcedureFromJson(json);

  final int id;
  final String title;
  final String subtitle;
  final String description;
  final int state_id;
  final int? organisation_id;
  final String process;
  final Success success;
  final String outcome_reason;
  final DateTime? created;
  final DateTime? end;
  final DateTime? last_changed;
  final int? carrier_id;
  final int? social_media_id;
  final bool visible;

  Map<String, dynamic> toJson() => _$ProcedureToJson(this);
}

enum Success {
  running,
  success,
  no_success,
}
