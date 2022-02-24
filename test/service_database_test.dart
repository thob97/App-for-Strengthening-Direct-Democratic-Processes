import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/categories.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/detailed_procedure.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/simple_procedure.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/success.dart';
import 'package:swp_direktdem_verf_app/service/service_database.dart';
import 'package:test/test.dart';

//ignore_for_file: require_trailing_commas
//TO RUN:
//flutter test test/service_database_test.dart
void main() {
  final ServiceDataBase service = ServiceDataBase();
  //we can assert that these user & procedure ids always exist in the db
  const String _testProcedureId = '1';
  const String _testOrganisationId = '1';
  const String _testNonProcedureId = '-1';
  const String _testNonUserId = '-1';
  const String _nonExistingEmail = '_@_.de';
  //used in tests
  String token = '';
  String loggedInUserId = _testNonUserId;
  String user2Id = _testNonUserId;
  String procedureId = _testNonProcedureId;
  final String loggedInEmail =
      'thore${Random().nextInt(1000000).toString()}@test.com';
  const String loggedInPassword = 'test';
  const String email2 = 'thore@test2.com';
  final String procedureTitle = Random().nextInt(1000000).toString();
  const String password2 = 'test';
  final DateTime end = DateTime(2000, 2, 2);
  final DateTime created = DateTime(2000, 2, 2);

  group('User Create:', () {
    group('CreateUser', () {
      test(' should fail: password & email missing', () async {
        final String? res = await service.createUser(
          firstName: 'Thore',
          lastName: '_',
          email: '',
          password: '',
        );

        expect(res, null);
      });
      test('should fail: wrong email format', () async {
        final String? res = await service.createUser(
          firstName: 'Thore',
          lastName: '_',
          email: 'thore',
          password: 'test',
        );

        expect(res, null);
      });
      test('should pass: user 1', () async {
        final String? res = await service.createUser(
          firstName: 'Thore',
          lastName: '_',
          email: loggedInEmail,
          password: loggedInPassword,
        );
        loggedInUserId = res ?? _testNonUserId;
        expect(res.runtimeType, String);
      });
      test('should pass: user 2', () async {
        final String? res = await service.createUser(
          firstName: 'Thore',
          lastName: '_',
          email: email2,
          password: password2,
        );
        user2Id = res ?? _testNonUserId;
        expect(loggedInUserId.runtimeType, String);
      });
      test('should fail: email already in use', () async {
        final String? res = await service.createUser(
          firstName: 'Thore',
          lastName: '_',
          email: loggedInEmail,
          password: loggedInPassword,
        );

        expect(res, null);
      });
    });
    group('UpdateUser', () {
      test('should pass: update just created user', () async {
        final bool res = await service.updateUser(
          userId: loggedInUserId,
          firstName: 'Updated Name',
          lastName: '_',
          email: loggedInEmail,
          password: loggedInPassword,
        );

        expect(res, true);
      });
      test('should fail: not existing user', () async {
        final bool res = await service.updateUser(
          userId: _testNonUserId,
          firstName: 'Updated Name',
          lastName: '_',
          email: 'thore@test.com',
          password: 'test',
        );

        expect(res, false);
      });
    });
    group('Authentication', () {
      test('should pass', () async {
        final String? res = await service.authenticate(
            email: loggedInEmail, password: loggedInPassword);
        token = res ?? '';
        service.token = token;
        debugPrint('Token: $res');
        expect(token != '', true);
      });
      test('should fail: Wrong credentials', () async {
        final String? res =
            await service.authenticate(email: '_', password: '_');

        expect(res, null);
      }, skip: true);
    });
    group('Verify Token', () {
      test('should pass', () async {
        final bool res = await service.verifyToken(token: token);

        expect(res, true);
      });
      test('should fail: Wrong token', () async {
        final bool res = await service.verifyToken(token: '_');

        expect(res, false);
      });
    });
    group('Subscribe', () {
      test('should pass: subscribe procedure with just created user', () async {
        final bool res = await service.subscribe(
          procedureId: _testProcedureId,
        );

        expect(res, true);
      });
      //TODO db: once error msg missing in db get resolved team: remove skip
      test('should fail: not existing procedure', () async {
        final bool res =
            await service.subscribe(procedureId: _testNonProcedureId);

        expect(res, false);
      }, skip: true);
    });
    test('GetOwnUser should pass:', () async {
      final String? res = await service.getOwnUser();
      expect(res.runtimeType, String);
      expect(res, loggedInUserId);
    });
  });

  group('New Procedures:', () {
    group('create:', () {
      test('should pass', () async {
        final String? res = await service.createProcedure(
          title: procedureTitle,
          //titleImage: '',
          subtitle: 'subtitle',
          description: 'description',
          process: 'process',
          outcomeReason: 'outcomeReason',
          category: ProcedureCategory.unknown,
          success: ProcedureSuccess.noSuccess,
          end: end,
          created: created,
          facebookUrl: '',
          instagramUrl: '',
          twitterUrl: '',
          websiteUrl: '',
          whatsappUrl: '',
          organisationId: _testOrganisationId,
        );
        procedureId = res ?? _testNonProcedureId;
        debugPrint('newProcedureId: $res');
        expect(res.runtimeType, String);
      });
      //TODO db: once error msg missing db gets resolved team: remove skip
      test('should fail: create the same procedure again', () async {
        final String? res = await service.createProcedure(
          title: 'title',
          //titleImage: '',
          subtitle: 'subtitle',
          description: 'description',
          process: 'process',
          outcomeReason: 'outcomeReason',
          category: ProcedureCategory.unknown,
          success: ProcedureSuccess.noSuccess,
          end: end,
          created: created,
          facebookUrl: '',
          instagramUrl: '',
          twitterUrl: '',
          websiteUrl: '',
          whatsappUrl: '',
          organisationId: _testOrganisationId,
        );
        expect(res, null);
      }, skip: true);
    });
    group('update:', () {
      test('should pass', () async {
        final bool res = await service.editProcedure(
          procedureId: procedureId,
          title: 'title',
          //titleImage: '',
          subtitle: 'subtitle',
          description: 'description',
          process: 'process',
          outcomeReason: 'outcomeReason',
          category: ProcedureCategory.unknown,
          success: ProcedureSuccess.noSuccess,
          carrierId: loggedInUserId,
          end: DateTime.now(),
          created: DateTime.now(),
          facebookUrl: '',
          instagramUrl: '',
          twitterUrl: '',
          websiteUrl: '',
          whatsappUrl: '',
          organisationId: _testOrganisationId,
        );

        expect(res, true);
      });
      //TODO db: once error msg missing db gets resolved team: remove skip
      test('should fail: update not existing procedure', () async {
        final bool res = await service.editProcedure(
          procedureId: _testNonProcedureId,
          title: 'title',
          //titleImage: '',
          subtitle: 'subtitle',
          description: 'description',
          process: 'process',
          outcomeReason: 'outcomeReason',
          category: ProcedureCategory.unknown,
          success: ProcedureSuccess.noSuccess,
          carrierId: user2Id,
          end: DateTime.now(),
          created: DateTime.now(),
          facebookUrl: '',
          instagramUrl: '',
          twitterUrl: '',
          websiteUrl: '',
          whatsappUrl: '',
          organisationId: _testOrganisationId,
        );

        expect(res, false);
      }, skip: true);
    });
    group('documents:', () {
      //TODO db: once implemented by db team: remove skip
      test('should pass: add', () async {
        final bool res = await service.addDocument(procedureId: procedureId);

        expect(res, true);
      }, skip: true);
      //TODO db: once implemented by db team: remove skip
      test('should pass: remove', () async {
        final bool res = await service.removeDocument(procedureId: procedureId);

        expect(res, true);
      }, skip: true);
    });
    group('editor:', () {
      test('should pass: add user2 as editor', () async {
        final bool res = await service.addEditor(
            userEmail: email2, procedureId: procedureId);
        expect(res, true);
      });
      test('should pass: remove editor user2', () async {
        final bool res = await service.removeEditor(
            userId: user2Id, procedureId: procedureId);

        expect(res, true);
      });
      //TODO db: once error msg missing db gets resolved team: remove skip
      test('should fail: add non existing user as editor', () async {
        final bool res = await service.addEditor(
            userEmail: _nonExistingEmail, procedureId: procedureId);

        expect(res, false);
      }, skip: true);
      //TODO db: once error msg missing db gets resolved team: remove skip
      test('should fail: remove non existing editor', () async {
        final bool res = await service.removeEditor(
            userId: user2Id, procedureId: _testNonUserId);

        expect(res, false);
      }, skip: true);
    });
    group('delete:', () {
      //TODO db: db bug: can not delete procedures
      test('should pass: delete', () async {
        final bool res =
            await service.deleteProcedure(procedureId: procedureId);

        expect(res, true);
      });
      test('should fail: delete not existing procedure', () async {
        final bool res =
            await service.deleteProcedure(procedureId: _testNonProcedureId);

        expect(res, false);
      });
    }, skip: true);
  });

  group('Get Procedures:', () {
    test('should pass: all visible simple', () async {
      final List<SimpleProcedure>? res =
          await service.getAllVisibleSimpleProcedures();

      expect(res.runtimeType, List<SimpleProcedure>);
    });
    group('By ProcedureId', () {
      test('should pass', () async {
        final DetailedProcedure? res =
            await service.getProcedureByID(_testProcedureId);

        expect(res.runtimeType, DetailedProcedure);
      });
      test('should fail: procedure does not exist', () async {
        final DetailedProcedure? res =
            await service.getProcedureByID(_testNonProcedureId);

        expect(res, null);
      });
    });
    //TODO db: once bugs in db get resolved team: remove skip
    group('By EditorId', () {
      test('should pass', () async {
        final List<SimpleProcedure>? res =
            await service.getOwnEditorProcedures();

        expect(res.runtimeType, List);
      });
      test('should fail: not logged in', () async {
        //logout
        final String _tempToken = service.token;
        service.logout();
        final List<SimpleProcedure>? res =
            await service.getOwnEditorProcedures();
        //login
        service.token = _tempToken;

        expect(res, []);
      });
    }, skip: true);
    group('By SubscriberId', () {
      test('should pass', () async {
        final List<SimpleProcedure>? res =
            await service.getSubscribedProcedures();

        expect(res.runtimeType, List<SimpleProcedure>);
      });
      test('should fail: not logged in', () async {
        //logout
        final String _tempToken = service.token;
        service.logout();
        final List<SimpleProcedure>? res =
            await service.getSubscribedProcedures();
        //login
        service.token = _tempToken;
        expect(res, []);
      });
    });
  });

  group('User Delete:', () {
    group('DeleteUser', () {
      //TODO db: db bug: can not delete users bc procedures can not be deleted
      test('should pass: remove user1', () async {
        final bool res = await service.deleteUser(loggedInUserId);

        expect(res, true);
      }, skip: true);
      test('should pass: remove user2', () async {
        final bool res = await service.deleteUser(user2Id);

        expect(res, true);
      });
      test('should fail: not existing user', () async {
        final bool res = await service.deleteUser(_testNonUserId);

        expect(res, false);
      });
    });
  });
}
