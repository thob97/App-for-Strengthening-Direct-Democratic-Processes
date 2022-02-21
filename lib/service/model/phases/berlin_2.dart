import 'package:json_annotation/json_annotation.dart';

part 'berlin_2.g.dart';

@JsonSerializable(explicitToJson: true)
class Berlin2 {
  const Berlin2({
    required this.id,
    //required this.referenceTime2a,
    //required this.referenceTime2b,
    //required this.quorum,
    required this.signaturesCollected,
    required this.signaturesValid,
    required this.signaturesCounted,
    required this.information,
    required this.begin,
    required this.end,
    required this.progress,
    required this.completed,
  });

  factory Berlin2.fromJson(Map<String, dynamic> json) =>
      _$Berlin2FromJson(json);
  @JsonKey(name: 'id')
  final int id;

  //@JsonKey(name: 'referenceTime2a')
  //final ReferenceTime referenceTime2a;
  //@JsonKey(name: 'referenceTime2b')
  //final ReferenceTime referenceTime2b;
  //@JsonKey(name: 'quorum')
  //final Quorum quorum;
  @JsonKey(name: 'signaturesCollected')
  final int? signaturesCollected;
  @JsonKey(name: 'signaturesValid')
  final int? signaturesValid;
  @JsonKey(name: 'signaturesCounted')
  final int? signaturesCounted;
  @JsonKey(name: 'information')
  final String information;
  @JsonKey(name: 'begin')
  final DateTime? begin;
  @JsonKey(name: 'end')
  final DateTime? end;
  @JsonKey(name: 'progress')
  final double progress;
  @JsonKey(name: 'completed')
  final bool completed;

  Map<String, dynamic> toJson() => _$Berlin2ToJson(this);
}
