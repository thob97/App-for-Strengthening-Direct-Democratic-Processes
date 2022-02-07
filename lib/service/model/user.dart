// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  const User({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.password,
    required this.last_login,
    required this.is_superuser,
    required this.is_staff,
    required this.is_active,
    required this.date_joined,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  final int id;
  final String first_name;
  final String last_name;
  final String email;
  final String password;
  final DateTime? last_login;
  final bool is_superuser;
  final bool is_staff;
  final bool is_active;
  final DateTime date_joined;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
