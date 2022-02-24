import 'package:json_annotation/json_annotation.dart';

//Order or enum is important, as index is used
enum ProcedureSuccess {
  @JsonValue('A_0')
  running,
  @JsonValue('A_1')
  success,
  @JsonValue('A_2')
  noSuccess,
  @JsonValue('A_3')
  partialSuccess,
}
