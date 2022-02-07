// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'quorum.g.dart';

@JsonSerializable(explicitToJson: true)
class Quorum {
  const Quorum({
    required this.id,
    required this.value,
    required this.valid_from,
  });

  factory Quorum.fromJson(Map<String, dynamic> json) => _$QuorumFromJson(json);
  final int id;
  final int value;
  final DateTime valid_from;

  Map<String, dynamic> toJson() => _$QuorumToJson(this);
}
