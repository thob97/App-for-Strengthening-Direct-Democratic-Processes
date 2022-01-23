import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/mocked_data/mocked_selected_procedure_service.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/my_bar_chart.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/my_pie_chart.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/elementary/my_expansion_panel_list.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/data_list_view.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/decision_description.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/process_description.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/social_media_view.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/vote_results_view.dart';

class SelectedProcedure extends StatelessWidget {
  //TODO add data bank

  List<Widget> _getWidgetsForVoteResultsView() {
    return [
      MyPieChart(
        votingList: MockedSelectedProcedureService.getPieChartData(),
        totalVotes: 170,
      ),
      MyBarChart(votingList: MockedSelectedProcedureService.getBarChartData()),
      const DecisionDescription(
        titleContent: MockedSelectedProcedureService.decisionTitle,
        descriptionContent: MockedSelectedProcedureService.decisionContent,
      ),
    ];
  }

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
          MyExpansionPanelList(topics: _getTopics()),
        ],
      ),
    );
  }

  List<Topic> _getTopics() {
    return [
      Topic(
        header: 'Phase',
        expandedWidget: const SizedBox(),
      ),
      Topic(
        header: 'Datein',
        expandedWidget: DataListView(
          dataList: MockedSelectedProcedureService.getPdfUrls(),
        ),
      ),
      Topic(
        header: 'Wahl Ergebnisse',
        expandedWidget: VoteResultsView(
          widgetList: _getWidgetsForVoteResultsView(),
        ),
      ),
      Topic(
        header: 'Social Media',
        expandedWidget: SocialMediaView(
          socialMediaList: MockedSelectedProcedureService.getSocialMedia(),
        ),
      ),
    ];
  }
}
