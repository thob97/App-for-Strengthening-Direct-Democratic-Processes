import 'package:json_annotation/json_annotation.dart';
import 'package:swp_direktdem_verf_app/service/model/appointment.dart';
import 'package:swp_direktdem_verf_app/service/model/document.dart';
import 'package:swp_direktdem_verf_app/service/model/organisation.dart';
import 'package:swp_direktdem_verf_app/service/model/phases/berlin_1.dart';
import 'package:swp_direktdem_verf_app/service/model/phases/berlin_2.dart';
import 'package:swp_direktdem_verf_app/service/model/phases/berlin_3.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/categories.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/success.dart';

part 'detailed_procedure.g.dart';

@JsonSerializable(explicitToJson: true)
class DetailedProcedure {
  const DetailedProcedure({
    required this.id,
    required this.documents,
    this.organisation,
    required this.process,
    required this.category,
    required this.success,
    required this.outcomeReason,
    this.created,
    this.end,
    this.lastChanged,
    this.facebook,
    this.twitter,
    this.instagram,
    this.whatsapp,
    this.website,
    required this.appointments,
    this.berlin1,
    this.berlin2,
    this.berlin3,
  });

  factory DetailedProcedure.fromJson(Map<String, dynamic> json) =>
      _$DetailedProcedureFromJson(json);

  @JsonKey(name: 'id')
  final String id;

  //@JsonKey(name: 'title')
  //final String title;
  //@JsonKey(name: 'subtitle')
  //final String subtitle;
  //@JsonKey(name: 'description')
  //final String description;
  @JsonKey(name: 'appointmentSet')
  final List<Appointment> appointments;
  @JsonKey(name: 'documentSet')
  final List<Document> documents;

  //@JsonKey(name: 'state')
  //final State state;
  //@JsonKey(name: 'editors')
  //final List<User> editors;
  @JsonKey(name: 'organisation')
  final Organisation? organisation;
  @JsonKey(name: 'process')
  final String process;
  @JsonKey(name: 'category')
  final ProcedureCategory category;
  @JsonKey(name: 'success')
  final ProcedureSuccess success;
  @JsonKey(name: 'outcomeReason')
  final String outcomeReason;
  @JsonKey(name: 'created')
  final DateTime? created;
  @JsonKey(name: 'end')
  final DateTime? end;
  @JsonKey(name: 'lastChanged')
  final DateTime? lastChanged;

  //@JsonKey(name: 'carrier')
  //final User carrier;
  //@JsonKey(name: 'stephistorySet')
  //final List<StepHistory> steps;
  @JsonKey(name: 'facebook')
  final String? facebook;
  @JsonKey(name: 'twitter')
  final String? twitter;
  @JsonKey(name: 'instagram')
  final String? instagram;
  @JsonKey(name: 'whatsapp')
  final String? whatsapp;
  @JsonKey(name: 'website')
  final String? website;
  @JsonKey(name: 'berlin_1')
  final Berlin1? berlin1;
  @JsonKey(name: 'berlin_2')
  final Berlin2? berlin2;
  @JsonKey(name: 'berlin_3')
  final Berlin3? berlin3;

  Map<String, dynamic> toJson() => _$DetailedProcedureToJson(this);
}
