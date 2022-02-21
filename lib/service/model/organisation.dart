import 'package:json_annotation/json_annotation.dart';
import 'package:swp_direktdem_verf_app/service/model/contact.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';

part 'organisation.g.dart';

@JsonSerializable()
class Organisation {
  const Organisation({
    required this.id,
    required this.name,
    required this.description,
    required this.admin,
    required this.contact,
  });

  factory Organisation.fromJson(Map<String, dynamic> json) =>
      _$OrganisationFromJson(json);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'admin')
  final User admin;
  @JsonKey(name: 'contact')
  final List<Contact> contact;

  Map<String, dynamic> toJson() => _$OrganisationToJson(this);
}
