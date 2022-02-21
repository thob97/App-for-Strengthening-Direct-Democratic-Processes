// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      id: json['id'] as String,
      document: json['document'] as String,
      uploadedBy: User.fromJson(json['uploadedBy'] as Map<String, dynamic>),
      category: $enumDecode(_$DocumentCategoryEnumMap, json['category']),
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'id': instance.id,
      'document': instance.document,
      'uploadedBy': instance.uploadedBy.toJson(),
      'category': _$DocumentCategoryEnumMap[instance.category],
    };

const _$DocumentCategoryEnumMap = {
  DocumentCategory.titleImage: 0,
  DocumentCategory.flyer: 1,
  DocumentCategory.officialDocument: 2,
};
