import 'package:swp_direktdem_verf_app/service/model/procedure/categories.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/detailed_procedure.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/simple_procedure.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/success.dart';

abstract class Service {
  ///Get procedures
  //TODO not yet implemented in db: title_Image
  Future<List<SimpleProcedure>?> getAllVisibleSimpleProcedures();

  Future<DetailedProcedure?> getProcedureByID(String procedureId);

  //TODO not yet implemented in db: title_Image
  Future<List<SimpleProcedure>?> getProceduresByEditor(String userId);

  //TODO not yet implemented in db: title_Image
  Future<List<SimpleProcedure>?> getProceduresBySubscriber(String userId);

  ///Edit procedures
  Future<String?> createProcedure({
    required String title,
    required String titleImage,
    String? subtitle,
    String? description,
    String? process,
    ProcedureCategory? category,
    ProcedureSuccess? success,
    String? outcomeReason,
    String? facebookUrl,
    String? twitterUrl,
    String? whatsappUrl,
    String? instagramUrl,
    String? websiteUrl,
    String? organisationId,
    DateTime? created,
    DateTime? end,
    required DateTime lastChanged,
  });

  Future<bool> deleteProcedure({required String procedureId});

  Future<bool> editProcedure({
    required String procedureId,
    String? title,
    String? titleImage,
    String? subtitle,
    String? description,
    String? process,
    ProcedureCategory? category,
    ProcedureSuccess? success,
    String? outcomeReason,
    String? facebookUrl,
    String? twitterUrl,
    String? whatsappUrl,
    String? instagramUrl,
    String? websiteUrl,
    String? carrierId,
    String? organisationId,
    DateTime? created,
    DateTime? end,
    DateTime? lastChanged,
  });

  //TODO not yet implemented in db
  Future<bool> addDocument({required String procedureId});

  //TODO not yet implemented in db
  Future<bool> removeDocument({required String procedureId});

  Future<bool> addEditor({
    required String userEmail,
    required String procedureId,
  });

  Future<bool> removeEditor({
    required String userId,
    required String procedureId,
  });

  ///Users

  //returns userId if succeeded
  Future<String?> getOwnUser();

  //returns token if succeeded
  Future<String?> authenticate({
    required String email,
    required String password,
  });

  Future<bool> verifyToken({required String token});

  //returns userId if succeeded
  Future<String?> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  //returns true if succeeded
  Future<bool> updateUser({
    required String userId,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  });

  //returns true if succeeded
  Future<bool> deleteUser(String userId);

  Future<bool> subscribe({required String procedureId});

  Future<bool> unSubscribe({required String procedureId});
}
