// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment {
  const Appointment({
    required this.id,
    required this.title,
    required this.description,
    required this.begin,
    required this.end,
    required this.procedure_id,
    this.address_id,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  final int id;
  final String title;
  final String description;
  final DateTime begin;
  final DateTime end;
  final int procedure_id;
  final int? address_id;

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}
