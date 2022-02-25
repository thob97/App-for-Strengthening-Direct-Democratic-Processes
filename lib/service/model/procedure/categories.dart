// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

//Order or enum is important, as index is used
enum ProcedureCategory {
  @JsonValue(0)
  unknown,
  @JsonValue(1)
  educationAndCulture,
  @JsonValue(2)
  demokratie_stateorganisation_domesticPolitics,
  @JsonValue(3)
  economy,
  @JsonValue(4)
  social,
  @JsonValue(5)
  health_Enviromentprotection_Consumerprotection,
  @JsonValue(6)
  traffic,
  @JsonValue(7)
  miscellaneous,
}
