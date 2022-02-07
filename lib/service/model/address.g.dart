// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: json['id'] as int,
      street: json['street'] as String,
      house_number: json['house_number'] as String,
      state: json['state'] as String,
      postcode: json['postcode'] as int,
      city: json['city'] as String,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'street': instance.street,
      'house_number': instance.house_number,
      'state': instance.state,
      'postcode': instance.postcode,
      'city': instance.city,
    };
