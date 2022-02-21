// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      id: json['id'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
    };
