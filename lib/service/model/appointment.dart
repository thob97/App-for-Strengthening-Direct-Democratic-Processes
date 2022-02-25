import 'package:json_annotation/json_annotation.dart';
import 'package:swp_direktdem_verf_app/service/model/address.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment {
  const Appointment({
    required this.id,
    required this.title,
    required this.description,
    this.begin,
    this.end,
    this.address,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'begin')
  final DateTime? begin;
  @JsonKey(name: 'end')
  final DateTime? end;
  @JsonKey(name: 'address')
  final Address? address;

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}
