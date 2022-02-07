// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'organisation.g.dart';

@JsonSerializable()
class Organisation {
  const Organisation({
    required this.id,
    required this.name,
    required this.description,
    required this.admin_id,
    required this.contact_id,
  });

  factory Organisation.fromJson(Map<String, dynamic> json) =>
      _$OrganisationFromJson(json);

  final int id;
  final String name;
  final String description;
  final int admin_id;
  final int contact_id;

  Map<String, dynamic> toJson() => _$OrganisationToJson(this);
}
