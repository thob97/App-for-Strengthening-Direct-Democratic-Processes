import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/data_list_view.dart';

mixin DatabaseSubstitute {
  static String getProcedureImg({required String procedureId}) {
    final List<String> _img = [
      'https://images.unsplash.com/photo-1644262241670-75fa18e00750?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80',
      'https://images.unsplash.com/photo-1644076778363-c7f68d2d0ade?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
      'https://images.unsplash.com/photo-1644077382090-f8a1fda81a9b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
      'https://images.unsplash.com/photo-1644072980122-22f4365d4519?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1644004344649-346f960fceac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80',
      'https://images.unsplash.com/photo-1644345553435-a8b092362058?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.pexels.com/photos/6587217/pexels-photo-6587217.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      'https://images.pexels.com/photos/4761770/pexels-photo-4761770.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      'https://images.pexels.com/photos/3584443/pexels-photo-3584443.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
    ];
    return _img[int.parse(procedureId) % _img.length];
  }

  static List<Data> getDocuments({required String procedureId}) {
    return [
      Data(
        title: 'Beispiel Document 1',
        url:
            'https://www.fu-berlin.de/studium/docs/studium/auslaufende/informatik-1.pdf',
      ),
      Data(
        title: 'Beispiel Document 2',
        url:
            'https://www.fu-berlin.de/studium/docs/studium/auslaufende/informatik-1.pdf',
      ),
      Data(
        title: 'Beispiel Document 3',
        url: 'https://www.clickdimensions.com/links/TestPDFfile.pdf',
      ),
      Data(
        title: 'Beispiel Document 4',
        url: 'https://s2.q4cdn.com/498544986/files/doc_downloads/test.pdf',
      ),
    ];
  }

  static String phaseTitle(int phase) {
    switch (phase) {
      case 0:
        return 'Phase 0: Initiierung.';
      case 1:
        return 'Phase 1: Antrag auf Volksbegehren';
      case 2:
        return 'Phase 2: Volksbegehren';
      case 3:
      default:
        return 'Phase 3: Volksentscheid';
    }
  }

  static String phaseInformation(int phase) {
    switch (phase) {
      case 0:
        return 'Auf Antrag schätzt die Verwaltung die Kosten der Verwirklichung des Volksbegehrens. Die Kostenschätzung muss auf der Unterschriftenliste aufgeführt sein.';
      case 1:
        return 'Um ein Volksbegehren starten zu können, muss dieses beantragt werden. Für den Volksbegehrensantrag müssen  20.000 gültige Unterschriften eingereicht werden.';
      case 2:
        return 'Mit dem Volksbegehren wird der Volksentscheid beantragt. Für ein Volksbegehren braucht es innerhalb von 4 Monaten die Unterstützung von 7 Prozent der in Berlin Wahlberechtigten';
      case 3:
      default:
        return 'Es kommt zu einem Volksentscheid, wenn das Abgeordnetenhaus den Gesetzentwurf nicht übernimmt. Ein Gesetz ist im Volksentscheid angenommen, wenn die Mehrheit für das Gesetz stimmt und die Mehrheit  mindestens einem Viertel der Stimmberechtigten entspricht.';
    }
  }
}
