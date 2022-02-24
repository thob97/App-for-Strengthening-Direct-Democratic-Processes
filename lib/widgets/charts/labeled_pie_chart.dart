import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/chart_model.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/legend.dart';

class LabeledPieChart extends StatelessWidget {
  const LabeledPieChart({
    required this.votingList,
    required this.height,
    this.simple = false,
    this.insideText,
  });

  final List<ChartModel> votingList;
  final double height;
  final bool simple;
  final String? insideText;

  int get totalVotes => votingList.fold(0, (p, n) => p + n.num);

  ///Style
  static const int _animationDurationMS = 500;
  static const double _distBetweenChartAndLegend = 10;
  static const int _middleOpeningSize = 50;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        children: [
          _pieChartWithLabelInside(context),
          if (!simple) const SizedBox(height: _distBetweenChartAndLegend),
          if (!simple) _legend(),
        ],
      ),
    );
  }

  Widget _pieChartWithLabelInside(BuildContext context) {
    return Flexible(
      child: Stack(
        alignment: Alignment.center,
        children: [
          _pieChart(context),
          if (insideText != null)
            _insideText(context: context, content: insideText!),
        ],
      ),
    );
  }

  Widget _pieChart(BuildContext context) {
    ///Bug if without <type>
    return IgnorePointer(
      child: charts.PieChart<String>(
        _prepareVotingData(),
        animate: false,
        animationDuration: const Duration(milliseconds: _animationDurationMS),
        //Removes default margin
        layoutConfig: charts.LayoutConfig(
          leftMarginSpec: charts.MarginSpec.fixedPixel(0),
          topMarginSpec: charts.MarginSpec.fixedPixel(0),
          rightMarginSpec: charts.MarginSpec.fixedPixel(0),
          bottomMarginSpec: charts.MarginSpec.fixedPixel(0),
        ),
        selectionModels: [
          charts.SelectionModelConfig(
            type: charts.SelectionModelType.info,
            updatedListener: (_) {},
            changedListener: (charts.SelectionModel model) {},
          )
        ],
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
          arcWidth: insideText != null ? _middleOpeningSize : 360,
          //inside label decorator
          arcRendererDecorators: [
            if (!simple)
              charts.ArcLabelDecorator(
                //otherwise weird transition 'bug' with hero
                labelPosition: charts.ArcLabelPosition.inside,
              )
          ],
        ),
      ),
    );
  }

  List<charts.Series<ChartModel, String>> _prepareVotingData() {
    return [
      charts.Series<ChartModel, String>(
        id: 'Votes',
        // For measurement
        domainFn: (ChartModel voting, _) => '${voting.group}: ${voting.num}',
        // For measurement
        measureFn: (ChartModel voting, _) => voting.num,
        // For colors
        colorFn: (ChartModel voting, _) =>
            charts.ColorUtil.fromDartColor(voting.color),
        data: votingList,
        // For label inside chart.
        labelAccessorFn: (ChartModel voting, _) =>
            '${((voting.num / totalVotes) * 100).round()}%',
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

  Widget _legend() {
    return Legend(
      items: votingList.map((_voting) {
        return LegendItem(
          circleColor: _voting.color,
          text: '${_voting.group}: ${_voting.num}',
        );
      }).toList(),
    );
  }
}
