import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/mocked_data/mocked_selected_procedure_service.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/labeled_pie_chart.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/stacked_bar_chart.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/elementary/my_expansion_panel_list.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/data_list_view.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/decision_description.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/procedure_img.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/process_description.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/social_media_view.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/vote_results_view.dart';

class SelectedProcedure extends StatelessWidget {
  const SelectedProcedure();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const ProcedureImg(
            showEdit: true,
            heroID: 0,
            imgAsset: MockedSelectedProcedureService.imgUrl,
            isFollowed: MockedSelectedProcedureService.isFollowed,
          ),
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

  List<Widget> _getWidgetsForVoteResultsView() {
    return [
      LabeledPieChart(
        votingList: MockedSelectedProcedureService.getPieChartData(),
        totalVotes: 170,
      ),
      StackedBarChart(
        votingList: MockedSelectedProcedureService.getBarChartData(),
      ),
      const DecisionDescription(
        titleContent: MockedSelectedProcedureService.decisionTitle,
        descriptionContent: MockedSelectedProcedureService.decisionContent,
      ),
    ];
  }
}
