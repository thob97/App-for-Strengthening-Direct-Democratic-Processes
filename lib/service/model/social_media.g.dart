// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialMedia _$SocialMediaFromJson(Map<String, dynamic> json) => SocialMedia(
      id: json['id'] as int,
      facebook: json['facebook'] as String?,
      twitter: json['twitter'] as String?,
      instagram: json['instagram'] as String?,
      whatsapp: json['whatsapp'] as String?,
      website: json['website'] as String?,
    );

Map<String, dynamic> _$SocialMediaToJson(SocialMedia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'facebook': instance.facebook,
      'twitter': instance.twitter,
      'instagram': instance.instagram,
      'whatsapp': instance.whatsapp,
      'website': instance.website,
    };
