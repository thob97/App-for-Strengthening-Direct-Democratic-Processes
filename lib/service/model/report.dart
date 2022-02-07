// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'report.g.dart';

@JsonSerializable()
class Report {
  const Report({
    required this.id,
    required this.procedure_id,
    required this.triggered_by_id,
    required this.created,
    required this.category,
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
  final int id;
  final int procedure_id;
  final int triggered_by_id;
  final DateTime created;
  final ReportCategories category;

  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

enum ReportCategories { newR, reported, changed }
