import 'package:json_annotation/json_annotation.dart';

part 'berlin_3.g.dart';

@JsonSerializable(explicitToJson: true)
class Berlin3 {
  const Berlin3({
    required this.id,
    //required this.referenceTime3,
    //required this.quorum,
    required this.voteDate,
    required this.votesCounted,
    required this.votesValid,
    required this.votesYes,
    required this.information,
    required this.begin,
    required this.end,
    required this.progress,
    required this.completed,
  });

  factory Berlin3.fromJson(Map<String, dynamic> json) =>
      _$Berlin3FromJson(json);
  @JsonKey(name: 'id')
  final int id;

  //@JsonKey(name: 'referenceTime3')
  //final ReferenceTime referenceTime3;
  //@JsonKey(name: 'quorum')
  //final Quorum quorum;
  @JsonKey(name: 'voteDate')
  final DateTime? voteDate;
  @JsonKey(name: 'votesCounted')
  final int? votesCounted;
  @JsonKey(name: 'votesValid')
  final int? votesValid;
  @JsonKey(name: 'votesYes')
  final int? votesYes;
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

  Map<String, dynamic> toJson() => _$Berlin3ToJson(this);
}
