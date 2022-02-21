import 'package:json_annotation/json_annotation.dart';

part 'berlin_1.g.dart';

@JsonSerializable(explicitToJson: true)
class Berlin1 {
  const Berlin1({
    required this.id,
    //required this.referenceTime1a,
    //required this.referenceTime1b,
    //required this.quorum,
    //required this.costsEstimated,
    //required this.costsOwnEstimated,
    required this.signaturesCollected,
    required this.signaturesValid,
    required this.signaturesCounted,
    required this.information,
    required this.begin,
    required this.end,
    required this.progress,
    required this.completed,
  });

  factory Berlin1.fromJson(Map<String, dynamic> json) =>
      _$Berlin1FromJson(json);
  @JsonKey(name: 'id')
  final int id;

  //@JsonKey(name: 'referenceTime1a')
  //final ReferenceTime referenceTime1a;
  //@JsonKey(name: 'referenceTime1b')
  //final ReferenceTime referenceTime1b;
  //@JsonKey(name: 'quorum')
  //final Quorum quorum;
  //@JsonKey(name: 'costsEstimated')
  //final double? costsEstimated;
  //@JsonKey(name: 'costsOwnEstimated')
  //final double? costsOwnEstimated;
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

  Map<String, dynamic> toJson() => _$Berlin1ToJson(this);
}
