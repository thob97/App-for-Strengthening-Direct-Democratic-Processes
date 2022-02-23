import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/chart_model.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/legend.dart';

class BarLineChart extends StatelessWidget {
  const BarLineChart({
    required this.height,
    required this.barChartData,
    this.lineChartData,
    this.xLabel,
    this.yLabel,
    this.simple = true,
  });

  final List<ChartModel> barChartData;
  final double height;
  final bool simple;
  final String? xLabel;
  final String? yLabel;
  final List<ChartModel>? lineChartData;

  ///style
  static const int yAxisTicks = 5;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        children: [
          _chart(context),
          if (!simple) _legend(context),
        ],
      ),
    );
  }

  Widget _chart(BuildContext context) {
    //flexible, else overflow with Hero
    return Flexible(
      child: IgnorePointer(
        child: charts.BarChart(
          _prepareData(context),
          animate: false,
          //hide primary axis (left)
          primaryMeasureAxis: charts.NumericAxisSpec(
            renderSpec: simple ? const charts.NoneRenderSpec() : null,
            tickProviderSpec: const charts.BasicNumericTickProviderSpec(
              //else bug with hero animation
              desiredTickCount: yAxisTicks,
            ),
          ),
          //hide domain axis (bottom)
          domainAxis: charts.OrdinalAxisSpec(
            renderSpec: simple ? const charts.NoneRenderSpec() : null,
          ),
          //Removes default margin
          layoutConfig: simple
              ? charts.LayoutConfig(
                  leftMarginSpec: charts.MarginSpec.fixedPixel(0),
                  topMarginSpec: charts.MarginSpec.fixedPixel(0),
                  rightMarginSpec: charts.MarginSpec.fixedPixel(0),
                  bottomMarginSpec: charts.MarginSpec.fixedPixel(0),
                )
              : null,
          //x and y labels
          behaviors: [
            if (!simple && xLabel != null)
              charts.ChartTitle(
                xLabel!,
                behaviorPosition: charts.BehaviorPosition.bottom,
                titleStyleSpec: _chartTextStyle(context),
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              ),
            if (!simple && yLabel != null)
              charts.ChartTitle(
                yLabel!,
                behaviorPosition: charts.BehaviorPosition.start,
                titleStyleSpec: _chartTextStyle(context),
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              ),
          ],
          defaultRenderer: charts.BarRendererConfig(
            groupingType: charts.BarGroupingType.stacked,
            /*
    barRendererDecorator: charts.BarLabelDecorator<String>(
              labelPosition: charts.BarLabelPosition.outside,
            ),*/
          ),
          customSeriesRenderers: [
            //show additional chart
            charts.LineRendererConfig(
              // ID used to link series to this renderer.
              customRendererId: 'lineChart',
            )
          ],
        ),
      ),
    );
  }

  List<charts.Series<ChartModel, String>> _prepareData(BuildContext context) {
    return [
      //barchart
      charts.Series<ChartModel, String>(
        id: 'barChart',
        colorFn: (ChartModel model, __) =>
            charts.ColorUtil.fromDartColor(model.color),
        domainFn: (ChartModel model, _) => model.label,
        measureFn: (ChartModel model, _) => model.num,
        data: barChartData,
      ),
      //draw additional line chart
      charts.Series<ChartModel, String>(
        id: 'lineChart',
        colorFn: (ChartModel model, __) =>
            charts.ColorUtil.fromDartColor(model.color),
        domainFn: (ChartModel model, _) => model.label,
        measureFn: (ChartModel model, _) => model.num,
        data: lineChartData ?? [],
      )

        // Configure our custom line renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'lineChart'),
    ];
  }

  charts.TextStyleSpec _chartTextStyle(BuildContext context) {
    final TextStyle? _theme = Theme.of(context).textTheme.overline;
    return charts.TextStyleSpec(
      fontWeight: _theme.toString(),
      fontSize: _theme?.fontSize?.toInt(),
      color: charts.ColorUtil.fromDartColor(_theme!.color!),
    );
  }

  Widget _legend(BuildContext context) {
    //get distinctGroups from chartData
    final Map<String, LegendItem> distinctGroups = {};
    for (final _chartM in barChartData) {
      distinctGroups[_chartM.group] =
          LegendItem(circleColor: _chartM.color, text: _chartM.group);
    }
    if (lineChartData != null) {
      for (final _chartM in lineChartData!) {
        distinctGroups[_chartM.group] =
            LegendItem(circleColor: _chartM.color, text: _chartM.group);
      }
    }
    return Legend(
      items: distinctGroups.values.toList(),
    );
  }
}
