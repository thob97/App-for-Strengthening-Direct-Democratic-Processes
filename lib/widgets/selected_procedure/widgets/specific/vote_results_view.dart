import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/chart_model.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/labeled_pie_chart.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/elementary/custom_page_view.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/decision_description.dart';

class VoteResultsView extends StatelessWidget {
  const VoteResultsView({
    required this.outcomeReason,
    required this.signaturesCollectedPhase1,
    required this.signaturesValidPhase1,
    required this.signaturesCountedPhase1,
    required this.signaturesValidPhase2,
    required this.signaturesCountedPhase2,
    required this.signaturesCollectedPhase2,
    required this.votesCountedPhase3,
    required this.votesValidPhase3,
    required this.votesYesPhase3,
  });

  final String? outcomeReason;
  final int? signaturesCollectedPhase1;
  final int? signaturesValidPhase1; //yes
  final int? signaturesCountedPhase1;
  final int? signaturesValidPhase2;
  final int? signaturesCountedPhase2;
  final int? signaturesCollectedPhase2;
  final int? votesCountedPhase3; //collected
  final int? votesValidPhase3; //counted
  final int? votesYesPhase3; //yes

  ///style
  static const double _horPad = 32;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _bodyWidgets = _getBodyWidgets();
    return _bodyWidgets.isEmpty
        ? _noResultsPlaceholder()
        : CustomPageView(
            pageViewHeight: 300,
            widgetList: _bodyWidgets,
            horChildPad: _horPad,
          );
  }

  List<Widget> _getBodyWidgets() {
    return [
      if (signaturesCollectedPhase1 != null ||
          signaturesValidPhase1 != null ||
          signaturesCountedPhase1 != null)
        _CustomVotesChart(
          title: 'Phase 1: Unterschriftensammlung',
          lostLabelVotes: 'Verloren',
          invalidLabelVotes: 'Ungültig',
          validLabelVotes: 'Gültig',
          collectedVotes: signaturesCollectedPhase1,
          countedVotes: signaturesCountedPhase1,
          validVotes: signaturesValidPhase1,
        ),
      if (signaturesCollectedPhase2 != null ||
          signaturesValidPhase2 != null ||
          signaturesCountedPhase2 != null)
        _CustomVotesChart(
          title: 'Phase 2: Unterschriftensammlung',
          lostLabelVotes: 'Verloren',
          invalidLabelVotes: 'Ungültig',
          validLabelVotes: 'Gültig',
          collectedVotes: signaturesCollectedPhase2,
          countedVotes: signaturesCountedPhase2,
          validVotes: signaturesValidPhase2,
        ),
      if (votesCountedPhase3 != null ||
          votesValidPhase3 != null ||
          votesYesPhase3 != null)
        _CustomVotesChart(
          title: 'Phase 3: Wahlergebnisse',
          lostLabelVotes: 'Ungültig',
          invalidLabelVotes: 'Dafür',
          validLabelVotes: 'Dagegen',
          collectedVotes: votesCountedPhase3,
          countedVotes: votesValidPhase3,
          validVotes: votesYesPhase3,
        ),
      if (outcomeReason != '')
        DecisionDescription(
          titleContent: 'Begründung',
          descriptionContent: outcomeReason!,
        ),
    ];
  }

  Widget _noResultsPlaceholder() {
    return const Center(
      child: Text('Es wurden noch keine Ergebnisse veröffentlicht'),
    );
  }
}

class _CustomVotesChart extends StatelessWidget {
  const _CustomVotesChart({
    required this.title,
    required this.countedVotes,
    required this.validVotes,
    required this.collectedVotes,
    required this.validLabelVotes,
    required this.invalidLabelVotes,
    required this.lostLabelVotes,
  });

  final String title;
  final int? countedVotes; //collected
  final int? validVotes; //counted
  final int? collectedVotes; //yes
  final String lostLabelVotes;
  final String validLabelVotes;
  final String invalidLabelVotes;

  ///Styles
  static const double _distBetweenTitleAndChart = 15;
  static const Color _lostVotesColor = Colors.lightBlueAccent;
  static const Color _validColor = Colors.greenAccent;
  static const Color _invalidVotesColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    int? lostVotes;
    int? invalidVotes;
    if (collectedVotes != null && countedVotes != null) {
      lostVotes = _getLostVotes(
        counted: countedVotes!,
        collected: collectedVotes!,
      );
    }
    if (countedVotes != null && validVotes != null) {
      invalidVotes = _getInvalidVotes(
        counted: countedVotes!,
        valid: validVotes!,
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _title(context),
        const SizedBox(height: _distBetweenTitleAndChart),
        _chart(lostVotes: lostVotes, invalidVotes: invalidVotes)
      ],
    );
  }

  Text _title(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6,
    );
  }

  LabeledPieChart _chart({
    required int? lostVotes,
    required int? invalidVotes,
  }) {
    return LabeledPieChart(
      totalVotes: countedVotes ?? 0,
      votingList: [
        if (lostVotes != null || lostVotes == 0)
          ChartModel(
            partyName: lostLabelVotes,
            label: lostLabelVotes,
            votes: lostVotes!,
            color: _lostVotesColor,
          ),
        if (invalidVotes != null || invalidVotes == 0)
          ChartModel(
            partyName: invalidLabelVotes,
            label: invalidLabelVotes,
            votes: invalidVotes!,
            color: _invalidVotesColor,
          ),
        if (validVotes != null || validVotes != 0)
          ChartModel(
            partyName: validLabelVotes,
            label: validLabelVotes,
            votes: validVotes!,
            color: _validColor,
          ),
      ],
    );
  }

  int? _getLostVotes({required int collected, required int counted}) {
    final int _lostVotes = collected - counted;
    return _lostVotes.isNegative ? null : _lostVotes;
  }

  int _getInvalidVotes({required int valid, required int counted}) {
    return counted - valid;
  }
}
