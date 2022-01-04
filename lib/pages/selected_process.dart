import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_process/data_list_view.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_process/my_expansion_panel_list.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_process/process_description.dart';

class SelectedProcess extends StatelessWidget {
  ///Dummy Data
  //TODO add data bank
  final String _title = 'Lorem Ipsum';
  final String _descriptionContent =
      'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';

  late final List<List<String>> _categoryContent = [
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
    ]
  ];

  final List<Data> _pdfUrls = [
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

  late final List<Topic> _topics = [
    Topic(
      header: 'Phase',
      expandedWidget: const SizedBox.shrink(),
    ),
    Topic(
      expandedWidget: DataListView(
        dataList: _pdfUrls,
      ),
      header: 'Datein',
    ),
    Topic(
      header: 'Wahl Ergebnisse',
      expandedWidget: const SizedBox.shrink(),
    ),
    Topic(
      header: 'Community Abstimmung',
      expandedWidget: const SizedBox.shrink(),
    )
  ];

  //TODO data bank
  ///Dummy Data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Ausgewählter Prozess'),
      body: ListView(
        children: [
          ProcessDescription(
            titleContent: _title,
            descriptionContent: _descriptionContent,
            categoryContent: _categoryContent,
          ),
          MyExpansionPanelList(topics: _topics),
        ],
      ),
    );
  }
}
