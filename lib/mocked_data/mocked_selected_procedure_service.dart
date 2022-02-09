import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/chart_model.dart';
import 'package:swp_direktdem_verf_app/widgets/home/overview_procedure_view.dart';
import 'package:swp_direktdem_verf_app/widgets/map/point_of_interest.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/data_list_view.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/social_media_view.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/what_happens_next.dart';
import 'package:tuple/tuple.dart';

mixin MockedSelectedProcedureService {
  static const String imgUrl = 'assets/procedure/politics.jpg';
  static const bool isFollowed = false;
  static const String title = 'Lorem Ipsum';
  static const String descriptionContent =
      'is simply procedure text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard procedure text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';

  static List<Data> getPdfUrls() {
    return [
      Data(
        title: 'Pdf1',
        url:
            'https://www.fu-berlin.de/studium/docs/studium/auslaufende/informatik-1.pdf',
      ),
      Data(
        title: 'Pdf2',
        url:
            'https://www.fu-berlin.de/studium/docs/studium/auslaufende/informatik-1.pdf',
      ),
      Data(
        title: 'Error PDF',
        url: 'error',
      )
    ];
  }

  static List<ChartModel> getPieChartData() {
    return [
      ChartModel(
        partyName: '',
        label: 'Dafür',
        votes: 100,
        color: Colors.green,
      ),
      ChartModel(
        partyName: '',
        label: 'Dagegen',
        votes: 75,
        color: Colors.red,
      ),
    ];
  }

  static List<ChartModel> getBarChartData() {
    return [
      ChartModel(
        partyName: 'CDU',
        label: 'Zustimmung',
        votes: 200,
        color: Colors.blue,
      ),
      ChartModel(
        partyName: 'AFD',
        label: 'Ablehnung',
        votes: 100,
        color: Colors.red,
      ),
      ChartModel(
        partyName: 'ALT',
        label: 'Ablehnung',
        votes: 100,
        color: Colors.green,
      ),
      ChartModel(
        partyName: 'RMB',
        label: 'Zustimmung',
        votes: 250,
        color: Colors.grey,
      ),
    ];
  }

  static const String decisionTitle = 'Beschlusstext';
  static const String decisionContent =
      'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics';

  static List<List<String>> getCategoryContent() {
    return [
      [
        'Von',
        'Vorgang',
        'erstellt am',
        'Abstimmung',
      ],
      [
        'David Müller',
        '233241',
        '10.12.2021',
        '13.02.2022',
      ],
    ];
  }

  static List<SocialMedia> getSocialMedia() {
    return [
      SocialMedia(
        type: SocialMediaType.facebook,
        url: 'https:www.facebook.com',
      ),
      SocialMedia(
        type: SocialMediaType.twitter,
        url: 'https:www.facebook.com',
      ),
      SocialMedia(
        type: SocialMediaType.instagram,
        url: 'https:www.facebook.com',
      ),
      SocialMedia(
        type: SocialMediaType.website,
        url: 'https:www.google.com',
      ),
    ];
  }

  static List<Instructions> getDummyWhatHappensNextInstructions() {
    return [
      Instructions(
        title: 'Überprüfung',
        subtitle: 'Ihr Antrag wird von uns auf Fehler überprüft.',
        asset: 'assets/what_happens_next/receive.png',
      ),
      Instructions(
        title: 'Bearbeitung',
        subtitle:
            'Nach erfolgreicher Prüfung werden wir Ihr Verfahren in eine Phase einordnen.',
        asset: 'assets/what_happens_next/confirmed.png',
      ),
      Instructions(
        title: 'Veröffentlichung',
        subtitle: 'Im Anschluss wird Ihr Verfahren veröffentlicht.',
        asset: 'assets/what_happens_next/ready.png',
      ),
    ];
  }

  static List<ProcedureOverview> getAllProcedures() {
    return [
      ProcedureOverview(
        title: 'Politics',
        description: 'Help us with the climate change',
        state: 1,
        img: 'assets/procedure/politics.jpg',
      ),
      ProcedureOverview(
        title: 'World',
        description: 'Stop the currency race',
        state: 2,
        img: 'assets/procedure/currency.jpg',
      ),
      ProcedureOverview(
        title: 'Army',
        description:
            'Reform the green Army from within. Join us now! We are located at the following',
        state: 3,
        img: 'assets/procedure/army.jpg',
      ),
      ProcedureOverview(
        title: 'Politics',
        description: 'Help us with the climate change',
        state: 1,
        img: 'assets/procedure/politics.jpg',
      ),
      ProcedureOverview(
        title: 'World',
        description: 'Stop the currency race',
        state: 2,
        img: 'assets/procedure/currency.jpg',
      ),
      ProcedureOverview(
        title: 'Army',
        description:
            'Reform the green Army from within. Join us now! We are located at the following',
        state: 3,
        img: 'assets/procedure/army.jpg',
      ),
      ProcedureOverview(
        title: 'Politics',
        description: 'Help us with the climate change',
        state: 1,
        img: 'assets/procedure/politics.jpg',
      ),
      ProcedureOverview(
        title: 'World',
        description: 'Stop the currency race',
        state: 2,
        img: 'assets/procedure/currency.jpg',
      ),
      ProcedureOverview(
        title: 'Army',
        description:
            'Reform the green Army from within. Join us now! We are located at the following',
        state: 3,
        img: 'assets/procedure/army.jpg',
      ),
    ];
  }

  static List<ProcedureOverview> getFavProcedures() {
    return [
      ProcedureOverview(
        title: 'Politics',
        description: 'Help us with the climate change',
        state: 1,
        img: 'assets/procedure/politics.jpg',
      ),
    ];
  }

  static List<ProcedureOverview> getMyProcedures() {
    return [
      ProcedureOverview(
        title: 'Politics',
        description: 'Help us with the climate change',
        state: 1,
        img: 'assets/procedure/politics.jpg',
      ),
    ];
  }

  // List with points of interest to pass to MapView
  static List<Tuple2<LatLng, PointOfInterest>> get pointsOfInterestList => [
        Tuple2(LatLng(52.3, 13.2), const PointOfInterest(location: 'Straße 1')),
        Tuple2(LatLng(52.4, 13.3), const PointOfInterest(location: 'Straße 2')),
        Tuple2(LatLng(52.5, 13.4), const PointOfInterest(location: 'Platz X')),
        Tuple2(LatLng(52.6, 13.5), const PointOfInterest(location: 'Straße 4')),
        Tuple2(LatLng(52.7, 13.6), const PointOfInterest(location: 'Straße 5')),
      ];
}
