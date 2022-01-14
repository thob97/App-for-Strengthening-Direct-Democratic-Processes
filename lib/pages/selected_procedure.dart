import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/mocked_data/mocked_selected_procedure_service.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/elementary/my_expansion_panel_list.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/process_description.dart';

class SelectedProcess extends StatelessWidget {
  //TODO add data bank

  late final List<Topic> _topics = [
    Topic(
      expandedWidget: const SizedBox(),
      header: 'Phase',
    ),
    Topic(
      expandedWidget: const SizedBox(),
      header: 'Datein',
    ),
    Topic(
      expandedWidget: const SizedBox(),
      header: 'Wahl Ergebnisse',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Ausgewählter Prozess'),
      body: ListView(
        children: [
          ProcessDescription(
            titleContent: MockedSelectedProcedureService.title,
            descriptionContent:
                MockedSelectedProcedureService.descriptionContent,
            categoryContent:
                MockedSelectedProcedureService.getCategoryContent(),
          ),
          MyExpansionPanelList(topics: _topics),
        ],
      ),
    );
  }
}
