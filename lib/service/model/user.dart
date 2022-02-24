import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    //required this.email,
    //required this.password,
    //required this.lastLogin,
    this.isSuperuser,
    this.isStaff,
    //required this.isActive,
    //required this.dateJoined,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'firstName')
  final String firstName;
  @JsonKey(name: 'lastName')
  final String lastName;

  //@JsonKey(name: 'email')
  //final String email;
  //@JsonKey(name: 'password')
  //final String password;
  //@JsonKey(name: 'lastLogin')
  //final DateTime? lastLogin;
  @JsonKey(name: 'isSuperuser')
  final bool? isSuperuser;
  @JsonKey(name: 'isStaff')
  final bool? isStaff;

  //@JsonKey(name: 'isActive')
  //final bool isActive;
  //@JsonKey(name: 'dateJoined')
  //final DateTime dateJoined;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
