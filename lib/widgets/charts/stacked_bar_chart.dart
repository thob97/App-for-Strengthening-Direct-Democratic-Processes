import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/chart_model.dart';

class StackedBarChart extends StatelessWidget {
  const StackedBarChart({required this.votingList});

  //First element decides position of bar.
  // Its group will be on the most left side.
  final List<ChartModel> votingList;

  ///Style
  static const int _animationDurationMS = 500;
  static const int _barWidth = 60;
  static const double _maxBarChartHeight = 250;
  static const double _horizontalPadding = 16;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _maxBarChartHeight,
      padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _myBarChart(context),
          _Legend(data: votingList, barWidth: _barWidth.toDouble()),
        ],
      ),
    );
  }

  Widget _myBarChart(BuildContext context) {
    return Flexible(
      child: charts.BarChart(
        _prepareData(context),
        animate: true,
        animationDuration: const Duration(milliseconds: _animationDurationMS),
        //hide primary axis (left)
        primaryMeasureAxis: const charts.NumericAxisSpec(
          renderSpec: charts.NoneRenderSpec(),
        ),
        //hide domain axis (bottom)
        domainAxis: const charts.OrdinalAxisSpec(
          renderSpec: charts.NoneRenderSpec(),
          showAxisLine: false,
        ),
        //Removes default margin
        layoutConfig: charts.LayoutConfig(
          leftMarginSpec: charts.MarginSpec.fixedPixel(0),
          topMarginSpec: charts.MarginSpec.fixedPixel(0),
          rightMarginSpec: charts.MarginSpec.fixedPixel(0),
          bottomMarginSpec: charts.MarginSpec.fixedPixel(0),
        ),
        defaultRenderer: charts.BarRendererConfig(
          barRendererDecorator: charts.BarLabelDecorator<String>(
            //inside label position
            labelPosition: charts.BarLabelPosition.inside,
            //inside label position
            labelAnchor: charts.BarLabelAnchor.middle,
            //inside label style
            insideLabelStyleSpec: charts.TextStyleSpec(
              fontSize: Theme.of(context).textTheme.caption?.fontSize?.ceil(),
              //color: charts.ColorUtil.fromDartColor(Theme.of(context).colorScheme),
              fontWeight:
                  Theme.of(context).textTheme.caption?.fontWeight.toString(),
              fontFamily: Theme.of(context).textTheme.caption?.fontFamily,
            ),
            //outside label style
            //Bugged
            /*
            outsideLabelStyleSpec: charts.TextStyleSpec(
              fontSize: Theme.of(context).textTheme.bodyText1!.fontSize!.ceil(),
              //color: charts.ColorUtil.fromDartColor(Theme.of(context).colorScheme),
              fontWeight:
                  Theme.of(context).textTheme.bodyText1!.fontWeight.toString(),
              fontFamily: Theme.of(context).textTheme.bodyText1!.fontFamily,
            ),
             */
          ),

          groupingType: charts.BarGroupingType.stacked,
          //for borders on the bars
          strokeWidthPx: 2.0,
          maxBarWidthPx: _barWidth,
        ),
      ),
    );
  }

  List<charts.Series<ChartModel, String>> _prepareData(BuildContext context) {
    return [
      charts.Series<ChartModel, String>(
        id: '0',
        data: votingList,
        domainFn: (ChartModel party, _) => party.label,
        measureFn: (ChartModel party, _) => party.votes,
        colorFn: (ChartModel party, __) =>
            charts.ColorUtil.fromDartColor(party.color),
        fillColorFn: (ChartModel party, __) =>
            charts.ColorUtil.fromDartColor(party.color),
        labelAccessorFn: (ChartModel party, _) => party.partyName,
      )
    ];
  }
}

class _Legend extends StatelessWidget {
  const _Legend({required this.data, required this.barWidth});

  //First element decides position of domain.
  // Its group will be on the most left side.
  final List<ChartModel> data;
  final double barWidth;

  ///Style
  static const double _dividerThickness = 2;
  static const double _dividerPointerHeight = 3;
  static const double _dividerPointerThickness = 2;
  static const double _distBetweenPointerAndDomains = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _myDivider(context),
        _legendDomains(context),
      ],
    );
  }

  Widget _myDivider(BuildContext context) {
    return Divider(
      height: 0,
      thickness: _dividerThickness,
      color: Theme.of(context).colorScheme.onBackground,
    );
  }

  Widget _legendDomains(BuildContext context) {
    final List<String> _distinctDomains = _findDistinctDomains();
    return Row(
      children: _distinctDomains.map((String _domain) {
        return Expanded(
          child: Column(
            children: [
              _dividerPointer(context),
              const SizedBox(height: _distBetweenPointerAndDomains),
              _domainText(context, _domain),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _dividerPointer(BuildContext context) {
    return Container(
      height: _dividerPointerHeight,
      width: _dividerPointerThickness,
      color: Theme.of(context).colorScheme.onBackground,
    );
  }

  Widget _domainText(BuildContext context, String content) {
    return Text(
      content,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.caption,
    );
  }

  List<String> _findDistinctDomains() {
    return data.map((_chartM) => _chartM.label).toSet().toList();
  }
}
