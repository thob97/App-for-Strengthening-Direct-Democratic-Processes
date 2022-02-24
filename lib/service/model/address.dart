import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  const Address({
    required this.id,
    required this.street,
    required this.houseNumber,
    required this.state,
    required this.postcode,
    required this.city,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'street')
  final String street;
  @JsonKey(name: 'houseNumber')
  final String houseNumber;
  @JsonKey(name: 'state')
  final String state;
  @JsonKey(name: 'postcode')
  final int postcode;
  @JsonKey(name: 'city')
  final String city;

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
