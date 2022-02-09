// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'reference_time.g.dart';

@JsonSerializable(explicitToJson: true)
class ReferenceTime {
  const ReferenceTime({
    required this.id,
    required this.value,
    required this.valid_from,
  });

  factory ReferenceTime.fromJson(Map<String, dynamic> json) =>
      _$ReferenceTimeFromJson(json);

  final int id;
  final Duration value; //TODO type Duration?
  final DateTime valid_from;

  Map<String, dynamic> toJson() => _$ReferenceTimeToJson(this);
}
