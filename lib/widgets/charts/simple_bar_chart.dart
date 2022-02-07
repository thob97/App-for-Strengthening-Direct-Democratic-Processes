import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/chart_model.dart';

class SimpleBarChart extends StatelessWidget {
  const SimpleBarChart({required this.data, required this.height});

  final List<DashboardModel> data;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: charts.BarChart(
        _prepareData(context),
        animate: true,
        //hide primary axis (left)
        primaryMeasureAxis: const charts.NumericAxisSpec(
          renderSpec: charts.NoneRenderSpec(),
          showAxisLine: false,
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
      ),
    );
  }

  List<charts.Series<DashboardModel, String>> _prepareData(
    BuildContext context,
  ) {
    return [
      charts.Series<DashboardModel, String>(
        id: 'BarChart',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(
          Theme.of(context).colorScheme.primary,
        ),
        domainFn: (DashboardModel model, _) => model.month.toString(),
        measureFn: (DashboardModel model, _) => model.num,
        data: data,
      )
    ];
  }
}
