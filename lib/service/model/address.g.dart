// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: json['id'] as String,
      street: json['street'] as String,
      houseNumber: json['houseNumber'] as String,
      state: json['state'] as String,
      postcode: json['postcode'] as int,
      city: json['city'] as String,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'street': instance.street,
      'houseNumber': instance.houseNumber,
      'state': instance.state,
      'postcode': instance.postcode,
      'city': instance.city,
    };
