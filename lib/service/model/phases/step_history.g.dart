// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepHistory _$StepHistoryFromJson(Map<String, dynamic> json) => StepHistory(
      id: json['id'] as int,
      procedure_id: json['procedure_id'] as int,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      step: $enumDecode(_$BerlinStepsEnumMap, json['step']),
    );

Map<String, dynamic> _$StepHistoryToJson(StepHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'procedure_id': instance.procedure_id,
      'date': instance.date?.toIso8601String(),
      'step': _$BerlinStepsEnumMap[instance.step],
    };

const _$BerlinStepsEnumMap = {
  BerlinSteps.vertrauenspersonen_benannt: 'vertrauenspersonen_benannt',
  BerlinSteps.kostenschaetzung_beantragt: 'kostenschaetzung_beantragt',
  BerlinSteps.kostenschaetzung_ergebnis_erhalten:
      'kostenschaetzung_ergebnis_erhalten',
  BerlinSteps.unterschriften_sammlung: 'unterschriften_sammlung',
  BerlinSteps.einleitung_volksbegehren_beantragt:
      'einleitung_volksbegehren_beantragt',
  BerlinSteps.ueberpruefung_beantragt: 'ueberpruefung_beantragt',
  BerlinSteps.antrag_ergebnis: 'antrag_ergebnis',
  BerlinSteps.antrag_zustande_gekommen: 'antrag_zustande_gekommen',
  BerlinSteps.befassung_abgeordnettenhaus: 'befassung_abgeordnettenhaus',
  BerlinSteps.verlangung_durchfuehrung_volksbegehren:
      'verlangung_durchfuehrung_volksbegehren',
  BerlinSteps.durchfuehrung_volksbegehren: 'durchfuehrung_volksbegehren',
  BerlinSteps.ergebnis_volksbegehren: 'ergebnis_volksbegehren',
  BerlinSteps.volksbegehren_zustande_gekommen:
      'volksbegehren_zustande_gekommen',
  BerlinSteps.vorbereitung_volksentscheid: 'vorbereitung_volksentscheid',
  BerlinSteps.ergebnis_volksentscheid: 'ergebnis_volksentscheid',
  BerlinSteps.ergebis_zusammen_getragen: 'ergebis_zusammen_getragen',
  BerlinSteps.unzulaessig_11_12: 'unzulaessig_11_12',
  BerlinSteps.unzulaessig_10_13_16: 'unzulaessig_10_13_16',
  BerlinSteps.ueberpruefung_zulaessigkeit_verfassungsgericht:
      'ueberpruefung_zulaessigkeit_verfassungsgericht',
  BerlinSteps.antrag_unszulaessig: 'antrag_unszulaessig',
  BerlinSteps.volksbegehren_nicht_zustande_gekommen:
      'volksbegehren_nicht_zustande_gekommen',
  BerlinSteps.uebernahme_inhalte_abgeordnetenhaus:
      'uebernahme_inhalte_abgeordnetenhaus',
};
