import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:swp_direktdem_verf_app/widgets/animated_bottom_navigation_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/chart_model.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/simple_bar_chart.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/simple_line_chart.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage();

  ///TODO get data from db
  List<_DashboardItem> get _sampleData =>
      sampleData().followedBy(sampleData()).toList();

  List<_DashboardItem> sampleData() {
    return [
      _DashboardItem.totalUsers(Random().nextInt(10000)),
      _DashboardItem.activeProcedureChart(
        _randomChartData(),
        Random().nextInt(60),
        Random().nextInt(60),
      ),
      _DashboardItem.startedProceduresChart(
        _randomChartData(),
        Random().nextInt(60),
        Random().nextInt(60),
      ),
      _DashboardItem.avgPhaseTime1(Random().nextInt(31), 0),
      _DashboardItem.avgPhaseTime2(Random().nextInt(60), 0),
      _DashboardItem.finishedProceduresChart(
        _randomChartData(),
        Random().nextInt(60),
        Random().nextInt(60),
      ),
      _DashboardItem.totalActiveProcedures(Random().nextInt(100)),
      _DashboardItem.totalFinishedProcedures(Random().nextInt(100)),
      _DashboardItem.avgPhaseTime3(0, Random().nextInt(12)),
      _DashboardItem.avgProcedureSuccessRate(30, 45),
      _DashboardItem.avgProcedureTime(Random().nextInt(36)),
    ];
  }

  List<DashboardModel> _randomChartData() {
    return List<DashboardModel>.generate(
      12,
      (index) => DashboardModel(month: index, num: Random().nextInt(20)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Dashboard'),
      bottomNavigationBar: const AnimatedNavBar(selectedIndex: 1),
      body: MasonryGridView.count(
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2,
        itemCount: _sampleData.length,
        itemBuilder: (context, index) {
          return _sampleData[index];
        },
      ),
    );
  }
}

class _DashboardItem extends StatelessWidget {
  const _DashboardItem({
    required this.caption,
    required this.title,
    this.subtitle,
    this.chart,
  });

  ///add new factories for additional statistics
  factory _DashboardItem.totalUsers(int totalUsers) {
    return _DashboardItem(
      caption: 'Benutzer',
      title: totalUsers.toString(),
    );
  }

  factory _DashboardItem.totalActiveProcedures(int totalProcedures) {
    return _DashboardItem(
      caption: 'Active Verfahren',
      title: totalProcedures.toString(),
    );
  }

  factory _DashboardItem.totalFinishedProcedures(int totalProcedures) {
    return _DashboardItem(
      caption: 'Geschlossene Verfahren',
      title: totalProcedures.toString(),
    );
  }

  factory _DashboardItem.avgPhaseTime1(int totalDays, int totalMonths) {
    final String title =
        totalMonths > 0 ? '$totalMonths Monate' : '$totalDays Tage';
    return _DashboardItem(
      caption: 'Durchschnittliche 1. Phasendauer',
      title: title,
    );
  }

  factory _DashboardItem.avgPhaseTime2(int totalDays, int totalMonths) {
    final String title =
        totalMonths > 0 ? '$totalMonths Monate' : '$totalDays Tage';
    return _DashboardItem(
      caption: 'Durchschnittliche 2. Phasendauer',
      title: title,
    );
  }

  factory _DashboardItem.avgPhaseTime3(int totalDays, int totalMonths) {
    final String title =
        totalMonths > 0 ? '$totalMonths Monate' : '$totalDays Tage';
    return _DashboardItem(
      caption: 'Durchschnittliche 3. Phasendauer',
      title: title,
    );
  }

  factory _DashboardItem.avgProcedureTime(int totalMonths) {
    return _DashboardItem(
      caption: 'Durchschnittliche Verfahrensdauer',
      title: '$totalMonths Monate',
    );
  }

  factory _DashboardItem.avgProcedureSuccessRate(int rate, int newRate) {
    final int _gainedRate = rate - newRate;
    final String _subtitle =
        _gainedRate.isNegative ? '$_gainedRate%' : '+$_gainedRate%';
    return _DashboardItem(
      caption: 'Durchschnittliche Verfahren-erfolgsrate',
      title: '$rate%',
      subtitle: _subtitle,
    );
  }

  factory _DashboardItem.activeProcedureChart(
    List<DashboardModel> data,
    int totalProcedures,
    int totalProceduresLastYear,
  ) {
    final int _gainedRate = totalProceduresLastYear - totalProcedures;
    final String _subtitle =
        _gainedRate.isNegative ? '$_gainedRate%' : '+$_gainedRate%';
    return _DashboardItem(
      caption: 'Neue Verfahren seid einem Jahr',
      title: totalProcedures.toString(),
      subtitle: _subtitle,
      chart: SimpleBarChart(data: data, height: _chartSize),
    );
  }

  factory _DashboardItem.startedProceduresChart(
    List<DashboardModel> data,
    int totalProcedures,
    int totalProceduresLastYear,
  ) {
    final int _gainedRate = totalProceduresLastYear - totalProcedures;
    final String _subtitle =
        _gainedRate.isNegative ? '$_gainedRate%' : '+$_gainedRate%';
    return _DashboardItem(
      caption: 'Gestartete Verfahren seid einem Jahr',
      title: totalProcedures.toString(),
      subtitle: _subtitle,
      chart: SimpleLineChart(data: data, height: _chartSize),
    );
  }

  factory _DashboardItem.finishedProceduresChart(
    List<DashboardModel> data,
    int totalProcedures,
    int totalProceduresLastYear,
  ) {
    final int _gainedRate = totalProceduresLastYear - totalProcedures;
    final String _subtitle =
        _gainedRate.isNegative ? '$_gainedRate%' : '+$_gainedRate%';
    return _DashboardItem(
      caption: 'Beendete Verfahren seid einem Jahr',
      title: totalProcedures.toString(),
      subtitle: _subtitle,
      chart: SimpleLineChart(data: data, height: _chartSize),
    );
  }

  final String caption;
  final String title;
  final String? subtitle;
  final Widget? chart;

  ///Style
  static const double _chartSize = 40;
  static const double _outerMargin = 2;
  static const double _innerPadding = 12;
  static const double _distBetweenItems = 8;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(_outerMargin),
      child: Padding(
        padding: const EdgeInsets.all(_innerPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _customCaption(context),
            const SizedBox(height: _distBetweenItems),
            _customTitle(context),
            if (subtitle != null) _customSubtitle(context),
            if (chart != null) const SizedBox(height: _distBetweenItems),
            if (chart != null) chart!,
          ],
        ),
      ),
    );
  }

  Widget _customCaption(BuildContext context) {
    return Text(
      caption,
      style: Theme.of(context).textTheme.caption,
    );
  }

  Widget _customTitle(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Widget _customSubtitle(BuildContext context) {
    return Text(
      subtitle!,
      style: Theme.of(context).textTheme.overline,
    );
  }
}
