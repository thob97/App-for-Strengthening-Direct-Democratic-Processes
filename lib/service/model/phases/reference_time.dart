import 'package:json_annotation/json_annotation.dart';

part 'reference_time.g.dart';

@JsonSerializable(explicitToJson: true)
class ReferenceTime {
  const ReferenceTime({
    required this.id,
    required this.validFrom,
  });

  factory ReferenceTime.fromJson(Map<String, dynamic> json) =>
      _$ReferenceTimeFromJson(json);

  @JsonKey(name: 'id')
  final int id;

  //@JsonKey(name: 'value')
  //final Duration value; //TODO type Duration?
  @JsonKey(name: 'validFrom')
  final DateTime validFrom;

  Map<String, dynamic> toJson() => _$ReferenceTimeToJson(this);
}
