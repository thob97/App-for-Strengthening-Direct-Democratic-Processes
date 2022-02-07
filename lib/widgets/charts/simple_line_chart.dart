/// Example of a simple line chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/chart_model.dart';

class SimpleLineChart extends StatelessWidget {
  const SimpleLineChart({required this.data, required this.height});

  final List<DashboardModel> data;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: charts.LineChart(
        _prepareData(context),
        animate: true,
        //hide primary axis
        primaryMeasureAxis: const charts.NumericAxisSpec(
          renderSpec: charts.NoneRenderSpec(),
        ),
        //hide domain axis
        domainAxis: const charts.NumericAxisSpec(
          renderSpec: charts.NoneRenderSpec(),
        ),
        //Removes default margin
        layoutConfig: charts.LayoutConfig(
          leftMarginSpec: charts.MarginSpec.fixedPixel(0),
          topMarginSpec: charts.MarginSpec.fixedPixel(0),
          rightMarginSpec: charts.MarginSpec.fixedPixel(0),
          bottomMarginSpec: charts.MarginSpec.fixedPixel(0),
        ),
      ),
    );
  }

  List<charts.Series<DashboardModel, int>> _prepareData(BuildContext context) {
    return [
      charts.Series<DashboardModel, int>(
        id: 'LineChart',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(
          Theme.of(context).colorScheme.primary,
        ),
        domainFn: (DashboardModel model, _) => model.month,
        measureFn: (DashboardModel model, _) => model.num,
        data: data,
      )
    ];
  }
}
