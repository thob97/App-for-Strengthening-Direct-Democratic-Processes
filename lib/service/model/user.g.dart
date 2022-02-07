// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      last_login: json['last_login'] == null
          ? null
          : DateTime.parse(json['last_login'] as String),
      is_superuser: json['is_superuser'] as bool,
      is_staff: json['is_staff'] as bool,
      is_active: json['is_active'] as bool,
      date_joined: DateTime.parse(json['date_joined'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'password': instance.password,
      'last_login': instance.last_login?.toIso8601String(),
      'is_superuser': instance.is_superuser,
      'is_staff': instance.is_staff,
      'is_active': instance.is_active,
      'date_joined': instance.date_joined.toIso8601String(),
    };
