// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'step_history.g.dart';

@JsonSerializable(explicitToJson: true)
class StepHistory {
  const StepHistory({
    required this.id,
    required this.procedure_id,
    required this.date,
    required this.step,
  });

  factory StepHistory.fromJson(Map<String, dynamic> json) =>
      _$StepHistoryFromJson(json);

  final int id;
  final int procedure_id;
  final DateTime? date;
  final BerlinSteps step;

  Map<String, dynamic> toJson() => _$StepHistoryToJson(this);
}

enum BerlinSteps {
  vertrauenspersonen_benannt, // 0
  kostenschaetzung_beantragt, // 1
  kostenschaetzung_ergebnis_erhalten, // 2
  unterschriften_sammlung, // 3
  einleitung_volksbegehren_beantragt, // 4
  ueberpruefung_beantragt, // 5
  antrag_ergebnis, // 6
  antrag_zustande_gekommen, // 7
  befassung_abgeordnettenhaus, // 8
  verlangung_durchfuehrung_volksbegehren, // 9
  durchfuehrung_volksbegehren, // 10
  ergebnis_volksbegehren, // 11
  volksbegehren_zustande_gekommen, // 12
  vorbereitung_volksentscheid, // 13
  ergebnis_volksentscheid, // 14
  ergebis_zusammen_getragen, // 15
  unzulaessig_11_12, // 16
  unzulaessig_10_13_16, // 17
  ueberpruefung_zulaessigkeit_verfassungsgericht, // 18
  antrag_unszulaessig, // 19
  volksbegehren_nicht_zustande_gekommen, // 20
  uebernahme_inhalte_abgeordnetenhaus, // 21
}
