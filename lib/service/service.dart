import 'package:swp_direktdem_verf_app/service/model/document.dart';
import 'package:swp_direktdem_verf_app/service/model/organisation.dart';
import 'package:swp_direktdem_verf_app/service/model/phases/berlin_1.dart';
import 'package:swp_direktdem_verf_app/service/model/phases/berlin_2.dart';
import 'package:swp_direktdem_verf_app/service/model/phases/berlin_3.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure_editor.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure_subscription.dart';
import 'package:swp_direktdem_verf_app/service/model/social_media.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';

abstract class Service {
  ///Procedures
  Future<List<Procedure>> getAllVisibleProcedures();

  Future<Procedure?> getProcedureByID(int procedureID);

  Future<List<Procedure>> getProceduresByEditor(int userId);

  Future<List<Procedure>> getProceduresBySubscriber(int userId);

  Future<bool> postProcedure({
    required Procedure procedure,
    required List<Document> documents,
    required List<ProcedureEditor> editors,
    required SocialMedia socialMedia,
  });

  Future<void> putProcedure({
    required int procedureID,
    required Procedure procedure,
    required List<Document> documents,
    required List<ProcedureEditor> editors,
    required SocialMedia socialMedia,
  });

  Future<void> deleteProcedure(int procedureID);

  ///More Procedures
  Future<List<Document>> getDocumentsFromProcedureId(int procedureId); //!=image
  Future<Document> getTitleImageFromProcedureId(int procedureId);

  Future<Organisation> getOrganisationFromId(int organisationId);

  Future<SocialMedia> getSocialMediaFromId(int socialMediaId);

  //Future<List<StepHistory>> getStepHistoryFromProcedureId(int procedureId);
  Future<Berlin_1> getBerlin1FromProcedureId(int procedureId);

  Future<Berlin_2> getBerlin2FromProcedureId(int procedureId);

  Future<Berlin_3> getBerlin3FromProcedureId(int procedureId);

  ///Users
  Future<List<User>> getAllUser();

  Future<int?> authenticate({required String email, required String password});

  Future<bool> postUser(User user);

  Future<void> putUser(int userId, User user);

  Future<void> deleteUser(int userId);

  Future<void> subscribeProcedure(ProcedureSubscription procedureSubscription);
}
