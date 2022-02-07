// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'social_media.g.dart';

@JsonSerializable()
class SocialMedia {
  const SocialMedia({
    required this.id,
    required this.facebook,
    required this.twitter,
    required this.instagram,
    required this.whatsapp,
    required this.website,
  });

  factory SocialMedia.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaFromJson(json);
  final int id;
  final String? facebook;
  final String? twitter;
  final String? instagram;
  final String? whatsapp;
  final String? website;

  Map<String, dynamic> toJson() => _$SocialMediaToJson(this);
}
