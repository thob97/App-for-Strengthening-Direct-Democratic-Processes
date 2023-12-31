import 'package:json_annotation/json_annotation.dart';
import 'package:swp_direktdem_verf_app/service/model/organisation.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/categories.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/success.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';

part 'simple_procedure.g.dart';

@JsonSerializable(explicitToJson: true)
class SimpleProcedure {
  SimpleProcedure({
    required this.id,
    required this.title,

    ///TODO db: not yet implemented by db team
    //required this.titleImage,
    required this.subtitle,
    required this.description,
    required this.process,
    required this.success,
    required this.category,
    required this.lastCompletedPhase,
    required this.createDate,
    required this.endDate,
    required this.carrier,
    required this.organisation,
  });

  factory SimpleProcedure.fromJson(Map<String, dynamic> json) =>
      _$SimpleProcedureFromJson(json);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'title')
  final String title;

  ///TODO db: not yet implemented by db team
  //@JsonKey()
  //final String titleImage;
  @JsonKey(name: 'subtitle')
  final String subtitle;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'process')
  final String process;
  @JsonKey(name: 'success')
  final ProcedureSuccess success;
  @JsonKey(name: 'category')
  final ProcedureCategory category;
  @JsonKey(name: 'phase')
  final int lastCompletedPhase;
  @JsonKey(name: 'created')
  final DateTime? createDate;
  @JsonKey(name: 'end')
  final DateTime? endDate;
  @JsonKey(name: 'carrier')
  final User? carrier;
  @JsonKey(name: 'organisation')
  final Organisation? organisation;

  Map<String, dynamic> toJson() => _$SimpleProcedureToJson(this);
}
