// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  const Address({
    required this.id,
    required this.street,
    required this.house_number,
    required this.state,
    required this.postcode,
    required this.city,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  final int id;
  final String street;
  final String house_number;
  final String state;
  final int postcode;
  final String city;

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
