import 'package:json_annotation/json_annotation.dart';
import 'package:swp_direktdem_verf_app/service/model/address.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  const Contact({
    required this.id,
    required this.email,
    required this.phone,
    required this.address,
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'phone')
  final String phone;
  @JsonKey(name: 'address')
  final Address? address;

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
