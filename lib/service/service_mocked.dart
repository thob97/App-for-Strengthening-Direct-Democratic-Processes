// ignore_for_file: avoid_function_literals_in_foreach_calls
import 'dart:convert';

import 'package:flutter/services.dart';
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
import 'package:swp_direktdem_verf_app/service/service.dart';

class ServiceMocked implements Service {
  ServiceMocked();

  //id, ...
  List<Procedure>? procedures;

  //email, ...
  List<User>? users;
  List<ProcedureSubscription>? subscriptions;
  List<ProcedureEditor>? editors;
  List<SocialMedia>? socialMedia;
  List<Document>? documents;

  ///init
  Future<List<Procedure>> _initProcedures() async {
    procedures = await rootBundle
        .loadString('assets/mocked_data/procedure.json')
        .then((data) => json.decode(data) as List<dynamic>)
        .then(
          (json) => json
              .map(
                (item) => Procedure.fromJson(item as Map<String, dynamic>),
              )
              .toList(),
        );
    return procedures!;
  }

  Future<List<User>> _initUsers() async {
    users = await rootBundle
        .loadString('assets/mocked_data/user.json')
        .then((data) => json.decode(data) as List<dynamic>)
        .then(
          (json) => json
              .map((item) => User.fromJson(item as Map<String, dynamic>))
              .toList(),
        );
    return users!;
  }

  Future<List<ProcedureSubscription>> _initSubscriptions() async {
    subscriptions = await rootBundle
        .loadString('assets/mocked_data/procedure_subscription.json')
        .then((data) => json.decode(data) as List<dynamic>)
        .then(
          (json) => json
              .map(
                (item) => ProcedureSubscription.fromJson(
                  item as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
    return subscriptions!;
  }

  Future<List<ProcedureEditor>> _initEditors() async {
    editors = await rootBundle
        .loadString('assets/mocked_data/procedure_editor.json')
        .then((data) => json.decode(data) as List<dynamic>)
        .then(
          (json) => json
              .map(
                (item) => ProcedureEditor.fromJson(
                  item as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
    return editors!;
  }

  Future<List<SocialMedia>> _initSocialMedia() async {
    socialMedia = await rootBundle
        .loadString('assets/mocked_data/social_media.json')
        .then((data) => json.decode(data) as List<dynamic>)
        .then(
          (json) => json
              .map(
                (item) => SocialMedia.fromJson(
                  item as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
    return socialMedia!;
  }

  Future<List<Document>> _initDocuments() async {
    documents = await rootBundle
        .loadString('assets/mocked_data/document.json')
        .then((data) => json.decode(data) as List<dynamic>)
        .then(
          (json) => json
              .map(
                (item) => Document.fromJson(
                  item as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
    return documents!;
  }

  ///get
  Future<List<Berlin_1>> _getBerlin_1() async {
    return rootBundle
        .loadString('assets/mocked_data/berlin_1.json')
        .then((data) => json.decode(data) as List<dynamic>)
        .then(
          (json) => json
              .map(
                (item) => Berlin_1.fromJson(
                  item as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
  }

  Future<List<Berlin_2>> _getBerlin_2() async {
    return rootBundle
        .loadString('assets/mocked_data/berlin_2.json')
        .then((data) => json.decode(data) as List<dynamic>)
        .then(
          (json) => json
              .map(
                (item) => Berlin_2.fromJson(
                  item as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
  }

  Future<List<Berlin_3>> _getBerlin_3() async {
    return rootBundle
        .loadString('assets/mocked_data/berlin_3.json')
        .then((data) => json.decode(data) as List<dynamic>)
        .then(
          (json) => json
              .map(
                (item) => Berlin_3.fromJson(
                  item as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
  }

/*
  Future<List<StepHistory>> _getStepHistory() async {
    return rootBundle
        .loadString('assets/mocked_data/step_history.json')
        .then((data) => json.decode(data) as List<dynamic>)
        .then(
          (json) => json
              .map(
                (item) => StepHistory.fromJson(
                  item as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
  }
 */

  Future<List<Organisation>> _getOrganisation() async {
    return rootBundle
        .loadString('assets/mocked_data/organisation.json')
        .then((data) => json.decode(data) as List<dynamic>)
        .then(
          (json) => json
              .map(
                (item) => Organisation.fromJson(
                  item as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
  }

  ///abstract methods
  @override
  Future<List<Procedure>> getAllVisibleProcedures() {
    return Future.delayed(const Duration(seconds: 2), () async {
      procedures ??= await _initProcedures();
      return procedures!.where((_proc) => _proc.visible).toList();
    });
  }

  @override
  Future<List<User>> getAllUser() {
    return Future.delayed(const Duration(seconds: 2), () async {
      users ??= await _initUsers();
      return users!;
    });
  }

  @override
  Future<int?> authenticate({
    required String email,
    required String password,
  }) {
    return Future.delayed(const Duration(seconds: 2), () async {
      users ??= await _initUsers();
      return users!
          .firstWhere(
            (_user) => _user.email == email && _user.password == password,
          )
          .id;
    });
  }

  @override
  Future<Procedure?> getProcedureByID(int procedureId) {
    return Future.delayed(const Duration(seconds: 2), () async {
      procedures ??= await _initProcedures();
      return procedures!.firstWhere((_proc) => _proc.id == procedureId);
    });
  }

  @override
  Future<List<Procedure>> getProceduresBySubscriber(int userId) {
    return Future.delayed(const Duration(seconds: 2), () async {
      subscriptions ??= await _initSubscriptions();
      procedures ??= await _initProcedures();
      return subscriptions!
          .where((sub) => sub.extendeduser_id == userId)
          .map(
            (sub) =>
                procedures!.firstWhere((_proc) => _proc.id == sub.procedure_id),
          )
          .toList();
    });
  }

  @override
  Future<List<Procedure>> getProceduresByEditor(int userId) {
    return Future.delayed(const Duration(seconds: 2), () async {
      editors ??= await _initEditors();
      procedures ??= await _initProcedures();
      return editors!
          .where((editor) => editor.extendeduser_id == userId)
          .map(
            (editor) => procedures!
                .firstWhere((_proc) => _proc.id == editor.procedure_id),
          )
          .toList();
    });
  }

  @override
  Future<void> subscribeProcedure(ProcedureSubscription procedureSubscription) {
    return Future.delayed(const Duration(seconds: 2), () async {
      subscriptions ??= await _initSubscriptions();
      subscriptions?.add(procedureSubscription);
    });
  }

  @override
  Future<void> deleteUser(int userId) {
    return Future.delayed(const Duration(seconds: 2), () async {
      users ??= await _initUsers();
      users!.removeWhere((_user) => _user.id == userId);
    });
  }

  @override
  Future<bool> postUser(User user) {
    return Future.delayed(const Duration(seconds: 2), () async {
      users ??= await _initUsers();
      final bool _alreadyInUse = users!.any(
        (_user) => _user.email == user.email && _user.password == user.password,
      );
      if (!_alreadyInUse) {
        users!.add(user);
        return true;
      } else {
        return false;
      }
    });
  }

  @override
  Future<void> putUser(int userId, User user) {
    return Future.delayed(const Duration(seconds: 2), () async {
      users ??= await _initUsers();
      users!.removeWhere((_user) => _user.id == userId);
      users!.add(user);
    });
  }

  @override
  Future<void> deleteProcedure(int procedureID) {
    return Future.delayed(const Duration(seconds: 2), () async {
      procedures ??= await _initProcedures();
      procedures!.removeWhere((_proc) => _proc.id == procedureID);
    });
  }

  @override
  Future<bool> postProcedure({
    required Procedure procedure,
    required List<Document> documents,
    required List<ProcedureEditor> editors,
    required SocialMedia socialMedia,
  }) {
    return Future.delayed(const Duration(seconds: 2), () async {
      procedures ??= await _initProcedures();
      this.documents ??= await _initDocuments();
      this.editors ??= await _initEditors();
      this.socialMedia ??= await _initSocialMedia();
      procedures!.add(procedure);
      this.documents!.addAll(documents);
      this.editors!.addAll(editors);
      this.socialMedia!.add(socialMedia);
      return true;
    });
  }

  @override
  Future<void> putProcedure({
    required int procedureID,
    required Procedure procedure,
    required List<Document> documents,
    required List<ProcedureEditor> editors,
    required SocialMedia socialMedia,
  }) {
    return Future.delayed(const Duration(seconds: 2), () async {
      procedures ??= await _initProcedures();
      this.documents ??= await _initDocuments();
      this.editors ??= await _initEditors();
      this.socialMedia ??= await _initSocialMedia();

      ///remove
      procedures!.removeWhere((_proc) => _proc.id == procedureID);
      this.documents!.removeWhere((_doc) => _doc.procedure_id == procedureID);
      this.editors!.removeWhere((_ed) => _ed.procedure_id == procedureID);

      ///add
      procedures!.add(procedure);
      this.documents!.addAll(documents);
      this.editors!.addAll(editors);
      this.socialMedia!.add(socialMedia);
    });
  }

  @override
  Future<Berlin_1> getBerlin1FromProcedureId(int procedureId) {
    return Future.delayed(const Duration(seconds: 2), () async {
      return _getBerlin_1().then(
        (berlin_1List) => berlin_1List
            .firstWhere((berlin_1) => berlin_1.procedure_id == procedureId),
      );
    });
  }

  @override
  Future<Berlin_2> getBerlin2FromProcedureId(int procedureId) {
    return Future.delayed(const Duration(seconds: 2), () async {
      return _getBerlin_2().then(
        (berlin_2List) => berlin_2List
            .firstWhere((berlin_2) => berlin_2.procedure_id == procedureId),
      );
    });
  }

  @override
  Future<Berlin_3> getBerlin3FromProcedureId(int procedureId) {
    return Future.delayed(const Duration(seconds: 2), () async {
      return _getBerlin_3().then(
        (berlin_3List) => berlin_3List
            .firstWhere((berlin_3) => berlin_3.procedure_id == procedureId),
      );
    });
  }

  @override
  Future<List<Document>> getDocumentsFromProcedureId(int procedureId) {
    return Future.delayed(const Duration(seconds: 2), () async {
      documents ??= await _initDocuments();
      return documents!
          .where(
            (_doc) =>
                _doc.procedure_id == procedureId &&
                _doc.category != Category.title_image,
          )
          .toList();
    });
  }

  @override
  Future<Document> getTitleImageFromProcedureId(int procedureId) {
    return Future.delayed(const Duration(seconds: 2), () async {
      documents ??= await _initDocuments();
      return documents!.firstWhere(
        (_doc) =>
            _doc.procedure_id == procedureId &&
            _doc.category == Category.title_image,
      );
    });
  }

  @override
  Future<Organisation> getOrganisationFromId(int organisationId) {
    return Future.delayed(const Duration(seconds: 2), () async {
      return (await _getOrganisation())
          .firstWhere((_org) => _org.id == organisationId);
    });
  }

  @override
  Future<SocialMedia> getSocialMediaFromId(int socialMediaId) {
    return Future.delayed(const Duration(seconds: 2), () async {
      socialMedia ??= await _initSocialMedia();
      return socialMedia!.firstWhere((_soc) => _soc.id == socialMediaId);
    });
  }

/*
  @override
  Future<List<StepHistory>> getStepHistoryFromProcedureId(int procedureId) {
    return Future.delayed(const Duration(seconds: 2), () async {
      return (await getStepHistory())
          .where((_step) => _step.procedure_id == procedureId)
          .toList();
    });
  }
   */
}
