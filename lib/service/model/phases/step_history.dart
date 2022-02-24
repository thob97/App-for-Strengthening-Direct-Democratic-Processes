// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'step_history.g.dart';

@JsonSerializable(explicitToJson: true)
class StepHistory {
  const StepHistory({
    required this.id,
    required this.date,
    required this.step,
  });

  factory StepHistory.fromJson(Map<String, dynamic> json) =>
      _$StepHistoryFromJson(json);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'date')
  final DateTime? date;
  @JsonKey(name: 'step')
  final BerlinSteps step;

  Map<String, dynamic> toJson() => _$StepHistoryToJson(this);
}

enum BerlinSteps {
  @JsonValue(0)
  vertrauenspersonen_benannt, // 0
  @JsonValue(1)
  kostenschaetzung_beantragt, // 1
  @JsonValue(2)
  kostenschaetzung_ergebnis_erhalten, // 2
  @JsonValue(3)
  unterschriften_sammlung, // 3
  @JsonValue(4)
  einleitung_volksbegehren_beantragt, // 4
  @JsonValue(5)
  ueberpruefung_beantragt, // 5
  @JsonValue(6)
  antrag_ergebnis, // 6
  @JsonValue(7)
  antrag_zustande_gekommen, // 7
  @JsonValue(8)
  befassung_abgeordnettenhaus, // 8
  @JsonValue(9)
  verlangung_durchfuehrung_volksbegehren, // 9
  @JsonValue(10)
  durchfuehrung_volksbegehren, // 10
  @JsonValue(11)
  ergebnis_volksbegehren, // 11
  @JsonValue(12)
  volksbegehren_zustande_gekommen, // 12
  @JsonValue(13)
  vorbereitung_volksentscheid, // 13
  @JsonValue(14)
  ergebnis_volksentscheid, // 14
  @JsonValue(15)
  ergebis_zusammen_getragen, // 15
  @JsonValue(16)
  unzulaessig_11_12, // 16
  @JsonValue(17)
  unzulaessig_10_13_16, // 17
  @JsonValue(18)
  ueberpruefung_zulaessigkeit_verfassungsgericht, // 18
  @JsonValue(19)
  antrag_unszulaessig, // 19
  @JsonValue(20)
  volksbegehren_nicht_zustande_gekommen, // 20
  @JsonValue(21)
  uebernahme_inhalte_abgeordnetenhaus, // 21
}
