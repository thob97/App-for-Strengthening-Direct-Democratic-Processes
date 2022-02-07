// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'procedure_subscription.g.dart';

@JsonSerializable()
class ProcedureSubscription {
  const ProcedureSubscription({
    required this.id,
    required this.extendeduser_id,
    required this.procedure_id,
  });

  factory ProcedureSubscription.fromJson(Map<String, dynamic> json) =>
      _$ProcedureSubscriptionFromJson(json);

  final int id;
  final int extendeduser_id;
  final int procedure_id;

  Map<String, dynamic> toJson() => _$ProcedureSubscriptionToJson(this);
}
