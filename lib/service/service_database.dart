import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/categories.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/detailed_procedure.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/simple_procedure.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/success.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';
import 'package:swp_direktdem_verf_app/service/service.dart';

class ServiceDataBase implements Service {
  String token = '';

  ///methods
  GraphQLClient init() {
    final HttpLink dbLink =
        HttpLink('http://democracy.imp.fu-berlin.de/graphql/');
    final AuthLink dbAuthLink =
        AuthLink(getToken: () => token == '' ? '' : 'JWT $token');
    return GraphQLClient(
      link: dbAuthLink.concat(dbLink),
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }

  bool userIsLoggedIn() {
    return token != '';
  }

  Future<bool> login({required String email, required String password}) async {
    final String? token = await authenticate(email: email, password: password);
    if (token == null) return false;
    this.token = token;
    return true;
  }

  void logout() {
    token = '';
  }

  Future<QueryResult> fetchData(String query) {
    final GraphQLClient client = init();
    return client.query(
      QueryOptions(
        document: gql(query),
      ),
    );
  }

  String? formatDate(DateTime? date) {
    return date == null ? null : DateFormat('yyyy-MM-dd').format(date);
  }

  ///Procedures
  @override
  Future<List<SimpleProcedure>?> getAllVisibleSimpleProcedures() async {
    ///TODO db: change once implemented by db team: titleImage
    const String query = '''
    query{
      procedures(visible:true){
        id,
        title,
        #titleImage, TODO db: change once implemented by db team
        subtitle,
        description,
        process,
        success,
        category,
        phase,
        created,
        end,
        carrier{id, firstName, lastName}
        organisation{name}
      }
    }
    ''';

    final QueryResult result = await fetchData(query);

    if (result.hasException) {
      debugPrint(
        'getAllVisibleSimpleProcedures: ${result.exception.toString()}',
      );
      return null;
    }
    return (result.data!['procedures'] as List<dynamic>)
        .map((_proc) => SimpleProcedure.fromJson(_proc as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<DetailedProcedure?> getProcedureByID(String procedureID) async {
    final String query = '''
    query{
      procedures(id:"$procedureID"){
        id,
        appointmentSet{
          id,
          title,
          description,
          begin,
          end,
          address{
            id,
            street,
            houseNumber,
            state,
            postcode,
            city,
          },
        },
        documentSet{
          id,
          document,
          category,
          uploadedBy{
            id,
            firstName,
            lastName,
            isStaff,
            isSuperuser,
          },
        },
        organisation{
          id,
          name,
          description,
          admin{
            id,
            firstName,
            lastName,
            isStaff,
            isSuperuser,
          },
          contact{
            id,
            address{
              id,
              street,
              houseNumber,
              state,
              postcode,
              city,
            },
            email,
            phone,
          },
        },
        process,
        category,
        success,
        outcomeReason,
        created,
        end,
        lastChanged,
        facebook,
        twitter,
        instagram,
        whatsapp,
        website,
        berlin1{
          id,
          signaturesCollected,
          signaturesValid,
          signaturesCounted,
          information,
          begin,
          end,
          progress,
          completed,
        },
        berlin2{
        	id,
          signaturesCollected,
          signaturesValid,
          signaturesCounted,
          information,
          begin,
          end,
          progress,
          completed,
        },
        berlin3{
          id,
          voteDate,
          votesCounted,
          votesValid,
          votesYes,
          information,
          begin,
          end,
          progress,
          completed,
        },
      }
    }
    ''';

    final QueryResult result = await fetchData(query);

    if (result.hasException) {
      debugPrint(
        'getProcedureByID: ${result.exception.toString()}',
      );
      return null;
    }
    final List<dynamic> _procedure =
        result.data!['procedures'] as List<dynamic>;
    return _procedure.isEmpty
        ? null
        : DetailedProcedure.fromJson(_procedure.first as Map<String, dynamic>);
  }

  ///TODO db: not yet implemented by db team
  @override
  Future<List<SimpleProcedure>?> getOwnEditorProcedures() async {
    ///TODO db: change once implemented by db team: titleImage
    //invisible procedures
    const String invisibleProceduresQuery = '''
    query{
      procedures(meEditor:true){
        id,
        title,
        #titleImage, TODO db: change once implemented by db team
        subtitle,
        description,
        process,
        success,
        category,
        phase,
        created,
        end,
        carrier{id, firstName, lastName}
        organisation{name}
      }
    }
    ''';

    final QueryResult invisibleResult =
        await fetchData(invisibleProceduresQuery);

    if (invisibleResult.hasException) {
      debugPrint(
        'getProceduresByEditor: ${invisibleResult.exception.toString()}',
      );
      return null;
    }

    //visible procedures
    const String visibleProceduresQuery = '''
    query{
      procedures(meEditor:true, visible:true){
        id,
        title,
        #titleImage, TODO db: change once implemented by db team
        subtitle,
        description,
        process,
        success,
        category,
        phase,
        created,
        end,
        carrier{id, firstName, lastName}
        organisation{name}
      }
    }
    ''';

    final QueryResult visibleResult = await fetchData(visibleProceduresQuery);

    if (visibleResult.hasException) {
      debugPrint(
        'getProceduresByEditor: ${visibleResult.exception.toString()}',
      );
      return null;
    }
    return (invisibleResult.data!['procedures'] as List<dynamic>)
        .map((_proc) => SimpleProcedure.fromJson(_proc as Map<String, dynamic>))
        .followedBy(
          (visibleResult.data!['procedures'] as List<dynamic>).map(
            (_proc) => SimpleProcedure.fromJson(_proc as Map<String, dynamic>),
          ),
        )
        .toList();
  }

  @override
  Future<List<SimpleProcedure>?> getSubscribedProcedures() async {
    ///TODO db: change once implemented by db team: titleImage
    const String query = '''
    query{
      procedures(visible: true, meSubscriber:true){
        id,
        title,
        #titleImage, TODO db: change once implemented by db team
        subtitle,
        description,
        process,
        success,
        category,
        phase,
        created,
        end,
        carrier{id, firstName, lastName}
        organisation{name}
      }
    }
    ''';

    final QueryResult result = await fetchData(query);

    if (result.hasException) {
      debugPrint(
        'getProceduresBySubscriber: ${result.exception.toString()}',
      );
      return null;
    }
    return (result.data!['procedures'] as List<dynamic>)
        .map((_proc) => SimpleProcedure.fromJson(_proc as Map<String, dynamic>))
        .toList();
  }

  ///Edit Procedures
  @override
  Future<String?> createProcedure({
    required String title,
    //required String titleImage,
    required String subtitle,
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
  }) async {
    ///TODO db: change once implemented by db team: titleImage
    final String query = '''
    mutation{
      createProcedure(
        title:"$title",
        #titleImage:"//titleImage", TODO db: change once implemented by db team
        subtitle:"$subtitle",
        description:"$description",
        process:"$process",
        outcomeReason:"$outcomeReason",
        category:${category?.index},
        success:${success?.index},
        facebook:"$facebookUrl",
        instagram:"$instagramUrl",
        twitter:"$twitterUrl",
        whatsapp:"$whatsappUrl",
        website:"$websiteUrl",
        stateId:"1",  #1 for berlin
        #organisationId:"$organisationId", TODO db: change once there are organisations
        created:"${formatDate(created)}",
        end:"${formatDate(end)}",
      ){
        procedure{
          id
        },
      }
    }
    ''';

    final QueryResult result = await fetchData(query);

    if (result.hasException) {
      debugPrint(
        'createProcedure: ${result.exception.toString()}',
      );
      return null;
    }
    return ((result.data!['createProcedure']
            as Map<String, dynamic>)['procedure'] as Map<String, dynamic>)['id']
        as String;
  }

  @override
  Future<bool> deleteProcedure({required String procedureId}) async {
    final String query = '''
    mutation{
      deleteProcedure(id:"$procedureId"){
        __typename
      }
    }
    ''';

    final QueryResult result = await fetchData(query);

    if (result.hasException) {
      debugPrint(
        'deleteProcedure: ${result.exception.toString()}',
      );
      return false;
    }
    return true;
  }

  @override
  Future<bool> editProcedure({
    required String procedureId,
    String? title,
    //String? titleImage,
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
  }) async {
    ///TODO db: change once implemented by db team: titleImage, category
    final String query = '''
    mutation{
      updateProcedure(
        id:"$procedureId",
        title:"$title",
        #titleImage:"//titleImage", TODO db: change once implemented by db team
        subtitle:"$subtitle",
        description:"$description",
        process:"$process",
        outcomeReason:"$outcomeReason", 
        #category:${category?.index}, TODO db: change once implemented by db team
        success:${success?.index},
        facebook:"$facebookUrl",
        instagram:"$instagramUrl",
        twitter:"$twitterUrl",
        whatsapp:"$whatsappUrl",
        website:"$websiteUrl",
        stateId:1,  #1 for berlin
        carrierId:"$carrierId",
        #organisationId:"$organisationId", TODO db: change once there are organisations
        created:"${formatDate(created)}",
        end:"${formatDate(end)}",
      ){
        __typename,
      }
    }
    ''';

    final QueryResult result = await fetchData(query);

    if (result.hasException) {
      debugPrint(
        'updateProcedure: ${result.exception.toString()}',
      );
      return false;
    }
    return true;
  }

  ///TODO db: not yet implemented by db team
  @override
  Future<bool> addDocument({required String procedureId}) {
    throw UnimplementedError();
  }

  ///TODO db: not yet implemented by db team
  @override
  Future<bool> removeDocument({required String procedureId}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> addEditor({
    required String userEmail,
    required String procedureId,
  }) async {
    final String query = '''
    mutation{
      addEditor(userEmail:"$userEmail", procedureId:"$procedureId"){
          __typename,
        }
    }
    ''';

    final QueryResult result = await fetchData(query);

    if (result.hasException) {
      debugPrint(
        'addEditor: ${result.exception.toString()}',
      );
      return false;
    }
    return true;
  }

  @override
  Future<bool> removeEditor({
    required String userId,
    required String procedureId,
  }) async {
    final String query = '''
    mutation{
      removeEditor(userId:"$userId", procedureId:"$procedureId"){
          __typename,
        }
    }
    ''';

    final QueryResult result = await fetchData(query);

    if (result.hasException) {
      debugPrint(
        'removeEditor: ${result.exception.toString()}',
      );
      return false;
    }
    return true;
  }

  ///Users
  Future<List<User>?> getAllUsers() async {
    ///TODO db: change once implemented by db team: titleImage
    const String query = '''
    query{
      user{
        id,
        firstName,
        lastName,
        email
      }
    }
    ''';

    final QueryResult result = await fetchData(query);

    if (result.hasException) {
      debugPrint(
        'getAllUsers: ${result.exception.toString()}',
      );
      return null;
    }
    debugPrint(result.data.toString());
    return (result.data!['user'] as List<dynamic>)
        .map((_proc) => User.fromJson(_proc as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<String?> getOwnUser() async {
    const String query = '''
    query{
      me{
        id
      }
    }
    ''';

    final QueryResult result = await fetchData(query);

    if (result.hasException) {
      debugPrint(
        'getOwnUser: ${result.exception.toString()}',
      );
      return null;
    }
    return (result.data!['me'] as Map<String, dynamic>)['id'] as String;
  }

  @override
  Future<String?> authenticate({
    required String email,
    required String password,
  }) async {
    final String query = '''
    mutation{
      tokenAuth(email:"$email", password:"$password"){
        token,
      }
    }
    ''';

    final QueryResult result = await fetchData(query);

    if (result.hasException) {
      debugPrint(
        'tokenAuth: ${result.exception.toString()}',
      );
      return null;
    }
    return (result.data!['tokenAuth'] as Map<String, dynamic>)['token']
        as String;
  }

  @override
  Future<bool> verifyToken({required String token}) async {
    final String query = '''
    mutation{
      verifyToken(token:"$token"){
        __typename,
      }
    }
    ''';

    final QueryResult result = await fetchData(query);

    if (result.hasException) {
      debugPrint(
        'verifyToken: ${result.exception.toString()}',
      );
      return false;
    }
    return true;
  }

  @override
  Future<String?> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final String query = '''
    mutation{
      createUser(firstName:"$firstName", lastName:"$lastName", email:"$email", password:"$password"){
        user{
          id
        }
      }
    }
    ''';

    final QueryResult result = await fetchData(query);

    if (result.hasException) {
      debugPrint(
        'createUser: ${result.exception.toString()}',
      );
      return null;
    }
    return ((result.data!['createUser'] as Map<String, dynamic>)['user']
        as Map<String, dynamic>)['id'] as String;
  }

  @override
  Future<bool> deleteUser(String userId) async {
    final String query = '''
    mutation{
      deleteUser(userId:"$userId"){
        __typename,
      }
    }
    ''';

    final QueryResult result = await fetchData(query);

    if (result.hasException) {
      debugPrint(
        'deleteUser: ${result.exception.toString()}',
      );
      return false;
    }
    return true;
  }

  @override
  Future<bool> updateUser({
    required String userId,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) async {
    final String query = '''
    mutation{
      updateUser(userId:"$userId", firstName:"$firstName", lastName:"$lastName", email:"$email", password:"$password"){
        __typename
      }
    }
    ''';

    final QueryResult result = await fetchData(query);

    if (result.hasException) {
      debugPrint(
        'updateUser: ${result.exception.toString()}',
      );
      return false;
    }
    return true;
  }

  @override
  Future<bool> subscribe({required String procedureId}) async {
    final String query = '''
    mutation{
      subscribeToProcedure(procedureId:$procedureId){
        __typename,
      }
    }
    ''';

    final QueryResult result = await fetchData(query);

    if (result.hasException) {
      debugPrint(
        'subscribeToProcedure: ${result.exception.toString()}',
      );
      return false;
    }
    return true;
  }

  ///TODO db: not yet implemented by db team
  @override
  Future<bool> unSubscribe({required String procedureId}) {
    throw UnimplementedError();
  }
}
