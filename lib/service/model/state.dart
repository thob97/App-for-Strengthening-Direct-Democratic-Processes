import 'package:json_annotation/json_annotation.dart';
import 'package:swp_direktdem_verf_app/service/model/contact.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/simple_procedure.dart';

part 'state.g.dart';

@JsonSerializable()
class State {
  const State({
    required this.id,
    required this.name,
    required this.contact,
    //required this.firstPhaseType,
    required this.procedures,
  });

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'contact')
  final Contact? contact;

  //@JsonKey(name: 'firstPhaseType')
  //final String firstPhaseType; //TODO intenum unknown
  @JsonKey(name: 'procedureSet')
  final List<SimpleProcedure> procedures;

  Map<String, dynamic> toJson() => _$StateToJson(this);
}

enum firstPhaseType { berlin_0, berlin_1, berlin_3 }
