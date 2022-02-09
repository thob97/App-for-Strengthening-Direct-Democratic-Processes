// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'procedure_editor.g.dart';

@JsonSerializable()
class ProcedureEditor {
  const ProcedureEditor({
    required this.id,
    required this.extendeduser_id,
    required this.procedure_id,
  });

  factory ProcedureEditor.fromJson(Map<String, dynamic> json) =>
      _$ProcedureEditorFromJson(json);

  final int id;
  final int extendeduser_id;
  final int procedure_id;

  Map<String, dynamic> toJson() => _$ProcedureEditorToJson(this);
}
