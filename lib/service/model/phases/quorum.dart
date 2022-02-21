import 'package:json_annotation/json_annotation.dart';

part 'quorum.g.dart';

@JsonSerializable(explicitToJson: true)
class Quorum {
  const Quorum({
    required this.id,
    required this.value,
    required this.validFrom,
  });

  factory Quorum.fromJson(Map<String, dynamic> json) => _$QuorumFromJson(json);
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'value')
  final int value;
  @JsonKey(name: 'validFrom')
  final DateTime validFrom;

  Map<String, dynamic> toJson() => _$QuorumToJson(this);
}
