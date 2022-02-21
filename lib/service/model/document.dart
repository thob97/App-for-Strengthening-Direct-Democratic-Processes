import 'package:json_annotation/json_annotation.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';

part 'document.g.dart';

@JsonSerializable(explicitToJson: true)
class Document {
  const Document({
    required this.id,
    required this.document,
    required this.uploadedBy,
    required this.category,
  });

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'document')
  final String document; //TODO db: not yet implemented by db team
  @JsonKey(name: 'uploadedBy')
  final User uploadedBy;
  @JsonKey(name: 'category')
  final DocumentCategory category;

  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}

enum DocumentCategory {
  @JsonValue(0)
  titleImage,
  @JsonValue(1)
  flyer,
  @JsonValue(2)
  officialDocument,
}
