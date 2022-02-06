import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/chart_model.dart';

class LabeledPieChart extends StatelessWidget {
  const LabeledPieChart({required this.votingList, required this.totalVotes});

  final List<ChartModel> votingList;
  final int totalVotes;

  ///Style
  static const int _animationDurationMS = 500;
  static const double _maxPieChartSize = 250;
  static const double _distBetweenChartAndLegend = 10;
  static const double _horizontalPadding = 16;
  static const int _middleOpeningSize = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _maxPieChartSize,
      padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: Column(
        children: [
          Flexible(
            child: Stack(
              alignment: Alignment.center,
              children: [
                _pieChart(context),
                _insideText(context: context, content: '$totalVotes\nStimmen'),
              ],
            ),
          ),
          const SizedBox(height: _distBetweenChartAndLegend),
          Legend(votingList: votingList),
        ],
      ),
    );
  }

  Widget _pieChart(BuildContext context) {
    ///Bug if without <type>
    return charts.PieChart<String>(
      _prepareVotingData(),
      animate: true,
      animationDuration: const Duration(milliseconds: _animationDurationMS),
      //Removes default margin
      layoutConfig: charts.LayoutConfig(
        leftMarginSpec: charts.MarginSpec.fixedPixel(0),
        topMarginSpec: charts.MarginSpec.fixedPixel(0),
        rightMarginSpec: charts.MarginSpec.fixedPixel(0),
        bottomMarginSpec: charts.MarginSpec.fixedPixel(0),
      ),
      /*behaviors: [
        charts.DatumLegend(
          //chart and label position
          position: charts.BehaviorPosition.bottom,
          //chart and label position
          outsideJustification: charts.OutsideJustification.endDrawArea,
          horizontalFirst: false,
          //desired max rows of outside label
          desiredMaxRows: 2,
          //desired max columns of outside label
          desiredMaxColumns: 1,
          //padding between outside label
          cellPadding: EdgeInsets.zero,
          entryTextStyle: charts.TextStyleSpec(
            fontSize: Theme.of(context).textTheme.bodyText1!.fontSize!.ceil(),
            fontWeight:
                Theme.of(context).textTheme.bodyText1!.fontWeight.toString(),
            color: charts.MaterialPalette.red.shadeDefault,
            fontFamily: 'Poppins',
          ),
        )
      ],*/
      defaultRenderer: charts.ArcRendererConfig(
        //chart hole width
        arcWidth: _middleOpeningSize,
        //inside label decorator
        arcRendererDecorators: [charts.ArcLabelDecorator()],
      ),
    );
  }

  List<charts.Series<ChartModel, String>> _prepareVotingData() {
    return [
      charts.Series<ChartModel, String>(
        id: 'Votes',
        // For label outside chart
        domainFn: (ChartModel voting, _) => '${voting.label}: ${voting.votes}',
        // For measurement
        measureFn: (ChartModel voting, _) => voting.votes,
        colorFn: (ChartModel voting, _) =>
            charts.ColorUtil.fromDartColor(voting.color),
        data: votingList,
        // For label inside chart.
        labelAccessorFn: (ChartModel voting, _) =>
            '${((voting.votes / totalVotes) * 100).round()}%',
      )
    ];
  }

  Widget _insideText({required BuildContext context, required String content}) {
    return Text(
      content,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}

class Legend extends StatelessWidget {
  const Legend({required this.votingList});

  final List<ChartModel> votingList;

  ///Style
  static const double _leadingCircleRadius = 4.5;
  static const double _distBetweenCircleAndText = 8;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: votingList.map((ChartModel _voting) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _leadingCircle(_voting),
              const SizedBox(width: _distBetweenCircleAndText),
              _legendText(context, _voting),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _leadingCircle(ChartModel _voting) {
    return Container(
      height: _leadingCircleRadius * 2,
      width: _leadingCircleRadius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _voting.color,
      ),
    );
  }

  Widget _legendText(BuildContext context, ChartModel _voting) {
    return Text(
      '${_voting.label}: ${_voting.votes}',
      style: Theme.of(context).textTheme.caption,
    );
  }
}
