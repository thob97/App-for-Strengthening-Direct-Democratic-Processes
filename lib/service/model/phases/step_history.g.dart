// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepHistory _$StepHistoryFromJson(Map<String, dynamic> json) => StepHistory(
      id: json['id'] as int,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      step: $enumDecode(_$BerlinStepsEnumMap, json['step']),
    );

Map<String, dynamic> _$StepHistoryToJson(StepHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'step': _$BerlinStepsEnumMap[instance.step],
    };

const _$BerlinStepsEnumMap = {
  BerlinSteps.vertrauenspersonen_benannt: 0,
  BerlinSteps.kostenschaetzung_beantragt: 1,
  BerlinSteps.kostenschaetzung_ergebnis_erhalten: 2,
  BerlinSteps.unterschriften_sammlung: 3,
  BerlinSteps.einleitung_volksbegehren_beantragt: 4,
  BerlinSteps.ueberpruefung_beantragt: 5,
  BerlinSteps.antrag_ergebnis: 6,
  BerlinSteps.antrag_zustande_gekommen: 7,
  BerlinSteps.befassung_abgeordnettenhaus: 8,
  BerlinSteps.verlangung_durchfuehrung_volksbegehren: 9,
  BerlinSteps.durchfuehrung_volksbegehren: 10,
  BerlinSteps.ergebnis_volksbegehren: 11,
  BerlinSteps.volksbegehren_zustande_gekommen: 12,
  BerlinSteps.vorbereitung_volksentscheid: 13,
  BerlinSteps.ergebnis_volksentscheid: 14,
  BerlinSteps.ergebis_zusammen_getragen: 15,
  BerlinSteps.unzulaessig_11_12: 16,
  BerlinSteps.unzulaessig_10_13_16: 17,
  BerlinSteps.ueberpruefung_zulaessigkeit_verfassungsgericht: 18,
  BerlinSteps.antrag_unszulaessig: 19,
  BerlinSteps.volksbegehren_nicht_zustande_gekommen: 20,
  BerlinSteps.uebernahme_inhalte_abgeordnetenhaus: 21,
};
