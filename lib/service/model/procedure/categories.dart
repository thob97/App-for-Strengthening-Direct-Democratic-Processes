// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

//Order or enum is important, as index is used
enum ProcedureCategory {
  @JsonValue('A_0')
  unknown,
  @JsonValue('A_1')
  educationAndCulture,
  @JsonValue('A_2')
  demokratie_stateorganisation_domesticPolitics,
  @JsonValue('A_3')
  economy,
  @JsonValue('A_4')
  social,
  @JsonValue('A_5')
  health_Enviromentprotection_Consumerprotection,
  @JsonValue('A_6')
  traffic,
  @JsonValue('A_7')
  miscellaneous,
}
