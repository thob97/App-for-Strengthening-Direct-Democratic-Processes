// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'document.g.dart';

@JsonSerializable(explicitToJson: true)
class Document {
  const Document({
    required this.id,
    required this.document,
    required this.procedure_id,
    required this.uploaded_by_id,
    required this.category,
  });

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  final int id;
  final String document; //TODO data type not final
  final int procedure_id;
  final int uploaded_by_id;
  final Category category;

  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}

enum Category {
  title_image,
  flyer,
  official_document,
}
