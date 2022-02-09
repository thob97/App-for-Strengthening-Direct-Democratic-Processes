// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      id: json['id'] as int,
      document: json['document'] as String,
      procedure_id: json['procedure_id'] as int,
      uploaded_by_id: json['uploaded_by_id'] as int,
      category: $enumDecode(_$CategoryEnumMap, json['category']),
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'id': instance.id,
      'document': instance.document,
      'procedure_id': instance.procedure_id,
      'uploaded_by_id': instance.uploaded_by_id,
      'category': _$CategoryEnumMap[instance.category],
    };

const _$CategoryEnumMap = {
  Category.title_image: 'title_image',
  Category.flyer: 'flyer',
  Category.official_document: 'official_document',
};
