import 'package:json_annotation/json_annotation.dart';

//Order or enum is important, as index is used
enum ProcedureSuccess {
  @JsonValue(0)
  running,
  @JsonValue(1)
  success,
  @JsonValue(2)
  noSuccess,
  @JsonValue(3)
  partialSuccess,
}
