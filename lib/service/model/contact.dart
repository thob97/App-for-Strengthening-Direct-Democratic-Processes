// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  const Contact({
    required this.id,
    required this.email,
    required this.phone,
    required this.address_id,
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  final int id;
  final String email;
  final String phone;
  final int? address_id;

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
