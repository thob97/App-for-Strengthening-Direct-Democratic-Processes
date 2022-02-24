import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:swp_direktdem_verf_app/widgets/animated_bottom_navigation_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/bar_line_chart.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/chart_model.dart';
import 'package:swp_direktdem_verf_app/widgets/charts/labeled_pie_chart.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({this.detailedWidget});

  final Widget? detailedWidget;

  ///Style
  static const double _simpleChartSize = 40;
  static const double _detailedChartSize = 250;
  static const double _distBetweenItems = 8;

  ///TODO get data from db
  static const int _randomData = 300;

  List<Widget> get _sampleData => sampleData();

  List<ChartModel> _sampleChartDateSuccessRate() {
    return [
      ChartModel(
        label: '',
        group: 'Ja',
        num: 4,
        color: ChartModel.positive1Green,
      ),
      ChartModel(
        label: '',
        group: 'Nein',
        num: 23,
        color: ChartModel.negativeRed,
      ),
      ChartModel(
        label: '',
        group: 'Offen',
        num: 7,
        color: ChartModel.positiveBlue,
      ),
      ChartModel(
        label: '',
        group: 'Teils',
        num: 5,
        color: ChartModel.positive2Green,
      ),
    ];
  }

  List<ChartModel> _sampleChartDatePhaseDistribution() {
    return [
      ChartModel(
        label: '',
        group: 'Phase1',
        num: Random().nextInt(10000),
        color: ChartModel.positive1Green,
      ),
      ChartModel(
        label: '',
        group: 'Phase2',
        num: Random().nextInt(10000),
        color: ChartModel.positiveBlue,
      ),
      ChartModel(
        label: '',
        group: 'Phase3',
        num: Random().nextInt(10000),
        color: ChartModel.negativeRed,
      ),
    ];
  }

  List<ChartModel> _randomLineChartData(String label) {
    return List<ChartModel>.generate(
      12,
      (index) => ChartModel(
        num: Random().nextInt(_randomData),
        color: ChartModel.positive1Green,
        group: label,
        label: index.toString(),
      ),
    );
  }

  List<ChartModel> _randomBarchartData(String label, {bool isRed = false}) {
    return List<ChartModel>.generate(
      12,
      (index) => ChartModel(
        num: Random().nextInt(_randomData),
        color: isRed ? ChartModel.negativeRed : ChartModel.positiveBlue,
        group: label,
        label: index.toString(),
      ),
    );
  }

  List<ChartModel> _randomStackedBarChartDataRuntime(
    String label,
    String stackedLabel,
  ) {
    return List<ChartModel>.generate(
      12,
      (index) => ChartModel(
        num: Random().nextInt(_randomData),
        color: ChartModel.positiveBlue,
        group: label,
        label: index.toString(),
      ),
    )
        .followedBy(
          List<ChartModel>.generate(
            12,
            (index) => ChartModel(
              num: Random().nextInt(_randomData),
              color: ChartModel.negativeRed,
              group: stackedLabel,
              label: index.toString(),
            ),
          ),
        )
        .toList();
  }

  List<Widget> sampleData() {
    return [
      _SampleDashboardItem.totalUsers(Random().nextInt(10000)),
      _SampleDashboardItem.successRate(
        data: _sampleChartDateSuccessRate(),
        successInPercent: ((4 / 39) * 100).toInt(),
      ),
      _SampleDashboardItem.runtimeOfProcedures(
        data: _randomStackedBarChartDataRuntime(
          'Verfahrensdauer ab Unterschrift',
          'mit Kosteneinschätzung',
        ),
        referenceTime: _randomLineChartData('Referenzdauer'),
        median: Random().nextInt(300),
      ),
      _SampleDashboardItem.successfulProceduresLastYear(
        Random().nextInt(_randomData),
      ),
      _SampleDashboardItem.totalActiveProcedures(Random().nextInt(_randomData)),
      _SampleDashboardItem.runtimeOfProceduresForEachPhase(
        phase1Data: _randomBarchartData('Verfahrensdauer'),
        phase2Data: _randomBarchartData('Verfahrensdauer'),
        phase3Data: _randomBarchartData('Verfahrensdauer'),
        referenceTimePhase1Data: _randomLineChartData('Referenzdauer'),
        referenceTimePhase2Data: _randomLineChartData('Referenzdauer'),
        referenceTimePhase3Data: _randomLineChartData('Referenzdauer'),
        medianPhase1: Random().nextInt(_randomData),
        medianPhase2: Random().nextInt(_randomData),
        medianPhase3: Random().nextInt(_randomData),
      ),
      _SampleDashboardItem.phaseDistribution(
        activeProceduresData: _sampleChartDatePhaseDistribution(),
        closedProceduresData: _sampleChartDatePhaseDistribution(),
        bothProceduresData: _sampleChartDatePhaseDistribution(),
      ),
      _SampleDashboardItem.finishedPhasesLastMonth(Random().nextInt(100)),
      _SampleDashboardItem.newProceduresLastYear(Random().nextInt(100)),
      _SampleDashboardItem.signatureResults(
        bothMedianPhase1: Random().nextInt(1000),
        bothMedianPhase2: Random().nextInt(1000),
        bothMedianPhase3: Random().nextInt(1000),
        bothPhase1Data: _randomStackedBarChartDataRuntime(
          'Gültige Unterschriften',
          'Ungültige Unterschriften',
        ),
        bothReferenceTimePhase1Data: _randomLineChartData('Quorum'),
        bothPhase2Data: _randomStackedBarChartDataRuntime(
          'Gültige Unterschriften',
          'Ungültige Unterschriften',
        ),
        bothReferenceTimePhase2Data: _randomLineChartData('Quorum'),
        bothPhase3Data: _randomStackedBarChartDataRuntime(
          'Gültige Unterschriften',
          'Ungültige Unterschriften',
        ),
        bothReferenceTimePhase3Data: _randomLineChartData('Quorum'),
        validMedianPhase1: Random().nextInt(1000),
        validMedianPhase2: Random().nextInt(1000),
        validMedianPhase3: Random().nextInt(1000),
        validPhase1Data: _randomBarchartData('Gültige Unterschriften'),
        validPhase2Data: _randomBarchartData('Gültige Unterschriften'),
        validPhase3Data: _randomBarchartData('Gültige Unterschriften'),
        invalidMedianPhase1: Random().nextInt(1000),
        invalidMedianPhase2: Random().nextInt(1000),
        invalidMedianPhase3: Random().nextInt(1000),
        invalidPhase1Data: _randomBarchartData(
          'Ungültige Unterschriften',
          isRed: true,
        ),
        invalidPhase2Data: _randomBarchartData(
          'Ungültige Unterschriften',
          isRed: true,
        ),
        invalidPhase3Data: _randomBarchartData(
          'Ungültige Unterschriften',
          isRed: true,
        ),
      ),
      _SampleDashboardItem.totalFinishedProcedures(Random().nextInt(100)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Dashboard'),
      bottomNavigationBar: const AnimatedNavBar(selectedIndex: 1),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          if (detailedWidget != null) detailedWidget!,
          _dashboard(),
        ],
      ),
    );
  }

  Widget _dashboard() {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      crossAxisCount: 2,
      itemCount: _sampleData.length,
      itemBuilder: (context, index) {
        return _sampleData[index];
      },
    );
  }
}

///add new methods for additional statistics
mixin _SampleDashboardItem {
  ///Charts
  static Widget successRate({
    required List<ChartModel> data,
    required int successInPercent,
  }) {
    final _key = UniqueKey();
    return _DashboardItem(
      caption: 'Erfolgsquote aller Verfahren',
      title: '$successInPercent%',
      heroId: _key,
      extendedChild: _DashboardItem(
        caption: 'Erfolgsquote aller Verfahren',
        title: '$successInPercent%',
        heroId: _key,
        child: LabeledPieChart(
          height: DashboardPage._detailedChartSize,
          votingList: data,
        ),
      ),
      child: LabeledPieChart(
        height: DashboardPage._simpleChartSize * 2,
        votingList: data,
        simple: true,
      ),
    );
  }

  static Widget phaseDistribution({
    required List<ChartModel> activeProceduresData,
    required List<ChartModel> closedProceduresData,
    required List<ChartModel> bothProceduresData,
  }) {
    final _key = UniqueKey();
    return _DashboardItem(
      caption: 'Verteilung der Verfahren nach Phase',
      title: '55%',
      subtitle: 'Phase 1',
      heroId: _key,
      extendedChild: _DashboardItemSwitcher(
        switcherItems: [
          _SwitcherParent(
            label: '',
            children: [
              _SwitcherChild(
                label: 'Alle',
                item: _DashboardItem(
                  caption: 'Verteilung der Verfahren nach Phase',
                  title: '55%',
                  subtitle: 'Phase 1',
                  heroId: _key,
                  child: LabeledPieChart(
                    height: DashboardPage._detailedChartSize,
                    votingList: bothProceduresData,
                  ),
                ),
              ),
              _SwitcherChild(
                label: 'Aktive',
                item: _DashboardItem(
                  caption: 'Verteilung der Verfahren nach Phase',
                  title: '34%',
                  subtitle: 'Phase 2',
                  heroId: _key,
                  child: LabeledPieChart(
                    height: DashboardPage._detailedChartSize,
                    votingList: activeProceduresData,
                  ),
                ),
              ),
              _SwitcherChild(
                label: 'Beendete',
                item: _DashboardItem(
                  caption: 'Verteilung der Verfahren nach Phase',
                  title: '80%',
                  subtitle: 'Phase 3',
                  heroId: _key,
                  child: LabeledPieChart(
                    height: DashboardPage._detailedChartSize,
                    votingList: closedProceduresData,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      child: LabeledPieChart(
        height: DashboardPage._simpleChartSize * 2,
        votingList: bothProceduresData,
        simple: true,
      ),
    );
  }

  static Widget runtimeOfProceduresForEachPhase({
    required List<ChartModel> phase1Data,
    required List<ChartModel> referenceTimePhase1Data,
    required List<ChartModel> phase2Data,
    required List<ChartModel> referenceTimePhase2Data,
    required List<ChartModel> phase3Data,
    required List<ChartModel> referenceTimePhase3Data,
    required int medianPhase1,
    required int medianPhase2,
    required int medianPhase3,
  }) {
    final _key = UniqueKey();
    return _DashboardItem(
      caption: 'Laufzeit der Verfahren nach Phase',
      title: '${medianPhase1.toString()} Tage',
      subtitle: 'median',
      heroId: _key,
      extendedChild: _DashboardItemSwitcher(
        switcherItems: [
          _SwitcherParent(
            label: '',
            children: [
              _SwitcherChild(
                label: 'Phase 1',
                item: _DashboardItem(
                  caption: 'Laufzeit der Verfahren nach Phase',
                  title: '${medianPhase1.toString()} Tage',
                  subtitle: 'median',
                  heroId: _key,
                  child: BarLineChart(
                    barChartData: phase1Data,
                    yLabel: 'Tage',
                    xLabel: 'Verfahren',
                    lineChartData: referenceTimePhase1Data,
                    height: DashboardPage._detailedChartSize,
                    simple: false,
                  ),
                ),
              ),
              _SwitcherChild(
                label: 'Phase 2',
                item: _DashboardItem(
                  caption: 'Laufzeit der Verfahren nach Phase',
                  title: '${medianPhase2.toString()} Tage',
                  subtitle: 'median',
                  heroId: _key,
                  child: BarLineChart(
                    barChartData: phase2Data,
                    yLabel: 'Tage',
                    xLabel: 'Verfahren',
                    lineChartData: referenceTimePhase2Data,
                    height: DashboardPage._detailedChartSize,
                    simple: false,
                  ),
                ),
              ),
              _SwitcherChild(
                label: 'Phase 3',
                item: _DashboardItem(
                  caption: 'Laufzeit der Verfahren nach Phase',
                  title: '${medianPhase3.toString()} Tage',
                  subtitle: 'median',
                  heroId: _key,
                  child: BarLineChart(
                    barChartData: phase3Data,
                    yLabel: 'Tage',
                    xLabel: 'Verfahren',
                    lineChartData: referenceTimePhase3Data,
                    height: DashboardPage._detailedChartSize,
                    simple: false,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      child: BarLineChart(
        barChartData: phase1Data,
        lineChartData: referenceTimePhase1Data,
        height: DashboardPage._simpleChartSize,
      ),
    );
  }

  static Widget runtimeOfProcedures({
    required List<ChartModel> data,
    required List<ChartModel> referenceTime,
    required int median,
  }) {
    final _key = UniqueKey();
    return _DashboardItem(
      caption: 'Gesamtverfahrensdauer',
      title: '${median.toString()} Tage',
      subtitle: 'median',
      heroId: _key,
      extendedChild: _DashboardItem(
        caption: 'Gesamtverfahrensdauer',
        title: '${median.toString()} Tage',
        subtitle: 'median',
        heroId: _key,
        child: BarLineChart(
          barChartData: data,
          yLabel: 'Tage',
          xLabel: 'Verfahren',
          lineChartData: referenceTime,
          height: DashboardPage._detailedChartSize,
          simple: false,
        ),
      ),
      child: BarLineChart(
        barChartData: data,
        lineChartData: referenceTime,
        height: DashboardPage._simpleChartSize,
      ),
    );
  }

  static Widget signatureResults({
    required int bothMedianPhase1,
    required int bothMedianPhase2,
    required int bothMedianPhase3,
    required List<ChartModel> bothPhase1Data,
    required List<ChartModel> bothReferenceTimePhase1Data,
    required List<ChartModel> bothPhase2Data,
    required List<ChartModel> bothReferenceTimePhase2Data,
    required List<ChartModel> bothPhase3Data,
    required List<ChartModel> bothReferenceTimePhase3Data,
    //chart2
    required int validMedianPhase1,
    //required int validAveragePhase1,
    //required int validStandardDeviationPhase1,
    required int validMedianPhase2,
    //required int validAveragePhase2,
    //required int validStandardDeviationPhase2,
    required int validMedianPhase3,
    //required int validAveragePhase3,
    //required int validStandardDeviationPhase3,
    required List<ChartModel> validPhase1Data,
    required List<ChartModel> validPhase2Data,
    required List<ChartModel> validPhase3Data,

    ///chart3
    required int invalidMedianPhase1,
    //required int invalidAveragePhase1,
    //required int invalidStandardDeviationPhase1,
    required int invalidMedianPhase2,
    //required int invalidAveragePhase2,
    //required int invalidStandardDeviationPhase2,
    required int invalidMedianPhase3,
    //required int invalidAveragePhase3,
    //required int invalidStandardDeviationPhase3,
    required List<ChartModel> invalidPhase1Data,
    required List<ChartModel> invalidPhase2Data,
    required List<ChartModel> invalidPhase3Data,
  }) {
    final _key = UniqueKey();
    const String _caption = 'Unterschriftensammlung';
    const String _subtitle = 'median';
    const String _xAxis = 'Verfahren';
    const String _yAxis = 'Unterschriften';
    const String _titleType = '';

    return _DashboardItem(
      caption: _caption,
      title: '${validMedianPhase1.toString()} $_titleType',
      subtitle: _subtitle,
      heroId: _key,
      extendedChild: _DashboardItemSwitcher(
        switcherItems: [
          _SwitcherParent(
            label: 'Alle',
            children: [
              _SwitcherChild(
                label: 'Phase 1',
                item: _DashboardItem(
                  caption: _caption,
                  title: '${bothMedianPhase1.toString()} $_titleType',
                  subtitle: _subtitle,
                  heroId: _key,
                  child: BarLineChart(
                    barChartData: bothPhase1Data,
                    yLabel: _yAxis,
                    xLabel: _xAxis,
                    lineChartData: bothReferenceTimePhase1Data,
                    height: DashboardPage._detailedChartSize,
                    simple: false,
                  ),
                ),
              ),
              _SwitcherChild(
                label: 'Phase 2',
                item: _DashboardItem(
                  caption: _caption,
                  title: '${bothMedianPhase2.toString()} $_titleType',
                  subtitle: _subtitle,
                  heroId: _key,
                  child: BarLineChart(
                    barChartData: bothPhase2Data,
                    yLabel: _yAxis,
                    xLabel: _xAxis,
                    lineChartData: bothReferenceTimePhase2Data,
                    height: DashboardPage._detailedChartSize,
                    simple: false,
                  ),
                ),
              ),
              _SwitcherChild(
                label: 'Phase 3',
                item: _DashboardItem(
                  caption: _caption,
                  title: '${bothMedianPhase3.toString()} $_titleType',
                  subtitle: _subtitle,
                  heroId: _key,
                  child: BarLineChart(
                    barChartData: bothPhase3Data,
                    yLabel: _yAxis,
                    xLabel: _xAxis,
                    lineChartData: bothReferenceTimePhase3Data,
                    height: DashboardPage._detailedChartSize,
                    simple: false,
                  ),
                ),
              ),
            ],
          ),
          _SwitcherParent(
            label: 'Gültige',
            children: [
              _SwitcherChild(
                label: 'Phase 1',
                item: _DashboardItem(
                  caption: _caption,
                  title: '${validMedianPhase1.toString()} $_titleType',
                  subtitle: _subtitle,
                  heroId: _key,
                  child: BarLineChart(
                    barChartData: validPhase1Data,
                    yLabel: _yAxis,
                    xLabel: _xAxis,
                    height: DashboardPage._detailedChartSize,
                    simple: false,
                  ),
                ),
              ),
              _SwitcherChild(
                label: 'Phase 2',
                item: _DashboardItem(
                  caption: _caption,
                  title: '${validMedianPhase2.toString()} $_titleType',
                  subtitle: _subtitle,
                  heroId: _key,
                  child: BarLineChart(
                    barChartData: validPhase2Data,
                    yLabel: _yAxis,
                    xLabel: _xAxis,
                    height: DashboardPage._detailedChartSize,
                    simple: false,
                  ),
                ),
              ),
              _SwitcherChild(
                label: 'Phase 3',
                item: _DashboardItem(
                  caption: _caption,
                  title: '${validMedianPhase3.toString()} $_titleType',
                  subtitle: _subtitle,
                  heroId: _key,
                  child: BarLineChart(
                    barChartData: validPhase3Data,
                    yLabel: _yAxis,
                    xLabel: _xAxis,
                    height: DashboardPage._detailedChartSize,
                    simple: false,
                  ),
                ),
              ),
            ],
          ),
          _SwitcherParent(
            label: 'Ungültige',
            children: [
              _SwitcherChild(
                label: 'Phase 1',
                item: _DashboardItem(
                  caption: _caption,
                  title: '${invalidMedianPhase1.toString()} $_titleType',
                  subtitle: _subtitle,
                  heroId: _key,
                  child: BarLineChart(
                    barChartData: invalidPhase1Data,
                    yLabel: _yAxis,
                    xLabel: _xAxis,
                    height: DashboardPage._detailedChartSize,
                    simple: false,
                  ),
                ),
              ),
              _SwitcherChild(
                label: 'Phase 2',
                item: _DashboardItem(
                  caption: _caption,
                  title: '${invalidMedianPhase2.toString()} $_titleType',
                  subtitle: _subtitle,
                  heroId: _key,
                  child: BarLineChart(
                    barChartData: invalidPhase2Data,
                    yLabel: _yAxis,
                    xLabel: _xAxis,
                    height: DashboardPage._detailedChartSize,
                    simple: false,
                  ),
                ),
              ),
              _SwitcherChild(
                label: 'Phase 3',
                item: _DashboardItem(
                  caption: _caption,
                  title: '${invalidMedianPhase3.toString()} $_titleType',
                  subtitle: _subtitle,
                  heroId: _key,
                  child: BarLineChart(
                    barChartData: invalidPhase3Data,
                    yLabel: _yAxis,
                    xLabel: _xAxis,
                    height: DashboardPage._detailedChartSize,
                    simple: false,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      child: BarLineChart(
        barChartData: bothPhase1Data,
        lineChartData: bothReferenceTimePhase1Data,
        height: DashboardPage._simpleChartSize,
      ),
    );
  }

  ///Other
  static Widget totalUsers(int totalUsers) {
    return _DashboardItem(
      caption: 'Benutzer',
      title: totalUsers.toString(),
    );
  }

  static Widget totalActiveProcedures(int totalProcedures) {
    return _DashboardItem(
      caption: 'Aktive Verfahren',
      title: totalProcedures.toString(),
    );
  }

  static Widget totalFinishedProcedures(int totalProcedures) {
    return _DashboardItem(
      caption: 'Beendete Verfahren',
      title: totalProcedures.toString(),
    );
  }

  static Widget successfulProceduresLastYear(int totalProcedures) {
    return _DashboardItem(
      caption: 'Erfolgreiche Verfahren',
      title: totalProcedures.toString(),
      subtitle: 'in letzten 12 Monaten',
    );
  }

  static Widget newProceduresLastYear(int totalProcedures) {
    return _DashboardItem(
      caption: 'Neue Verfahren',
      title: totalProcedures.toString(),
      subtitle: 'in letzten 12 Monaten',
    );
  }

  static Widget finishedPhasesLastMonth(int totalProcedures) {
    return _DashboardItem(
      caption: 'Abgeschlossene Phasen',
      title: totalProcedures.toString(),
      subtitle: 'im letzten Monat',
    );
  }

  // ignore: unused_element
  static Widget avgPhaseTime1(int totalDays, int totalMonths) {
    final String title =
        totalMonths > 0 ? '$totalMonths Monate' : '$totalDays Tage';
    return _DashboardItem(
      caption: 'Durchschnittliche 1. Phasendauer',
      title: title,
    );
  }

  // ignore: unused_element
  static Widget avgPhaseTime2(int totalDays, int totalMonths) {
    final String title =
        totalMonths > 0 ? '$totalMonths Monate' : '$totalDays Tage';
    return _DashboardItem(
      caption: 'Durchschnittliche 2. Phasendauer',
      title: title,
    );
  }

  // ignore: unused_element
  static Widget avgPhaseTime3(int totalDays, int totalMonths) {
    final String title =
        totalMonths > 0 ? '$totalMonths Monate' : '$totalDays Tage';
    return _DashboardItem(
      caption: 'Durchschnittliche 3. Phasendauer',
      title: title,
    );
  }

  // ignore: unused_element
  static Widget avgProcedureTime(int totalMonths) {
    return _DashboardItem(
      caption: 'Durchschnittliche Verfahrensdauer',
      title: '$totalMonths Monate',
    );
  }

  // ignore: unused_element
  static Widget avgProcedureSuccessRate(int rate, int newRate) {
    final int _gainedRate = rate - newRate;
    final String _subtitle =
        _gainedRate.isNegative ? '$_gainedRate%' : '+$_gainedRate%';
    return _DashboardItem(
      caption: 'Durchschnittliche Verfahren-erfolgsrate',
      title: '$rate%',
      subtitle: _subtitle,
    );
  }
}

class _DashboardCard extends StatelessWidget {
  const _DashboardCard({required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  ///Style
  static const double _outerMargin = 2;
  static const double _innerPadding = 12;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(_outerMargin),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(_innerPadding),
            child: child,
          ),
        ),
      ),
    );
  }
}

///_DashboardItemSwapper
//Provides up to two buttons to switch between items

//Provides the lower Button
class _SwitcherParent {
  const _SwitcherParent({required this.label, required this.children});

  final String label;
  final List<_SwitcherChild> children;
}

//Provides the upper Button
class _SwitcherChild {
  const _SwitcherChild({required this.label, required this.item});

  final String label;
  final _DashboardItem item;
}

class _DashboardItemSwitcher extends StatefulWidget {
  const _DashboardItemSwitcher({required this.switcherItems});

  final List<_SwitcherParent> switcherItems;

  ///style
  static const double buttonWidth = 120;

  @override
  State<_DashboardItemSwitcher> createState() => _DashboardItemSwitcherState();
}

class _DashboardItemSwitcherState extends State<_DashboardItemSwitcher> {
  int upperChildButtonIndex = 0;
  int lowerParentButtonIndex = 0;
  late final List<_SwitcherParent> parents = widget.switcherItems;
  late _SwitcherParent currentParent = parents[lowerParentButtonIndex];
  late List<_SwitcherChild> children = currentParent.children;
  late _SwitcherChild currentChild = children[upperChildButtonIndex];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        currentChild.item,
        _buttons(),
      ],
    );
  }

  Widget _buttons() {
    return Container(
      //same padding as dashboardCard -> aligns in corner
      padding: const EdgeInsets.all(_DashboardCard._innerPadding),
      width: _DashboardItemSwitcher.buttonWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _upperDropDownButton(),
          const SizedBox(height: DashboardPage._distBetweenItems),
          if (parents.length > 1) _lowerDropDownButton(),
        ],
      ),
    );
  }

  Widget _upperDropDownButton() {
    return DropdownButton<int>(
      isDense: true,
      isExpanded: true,
      underline: const SizedBox.shrink(),
      value: upperChildButtonIndex,
      items: List<DropdownMenuItem<int>>.generate(children.length, (index) {
        return DropdownMenuItem<int>(
          value: index,
          child: Text(children[index].label),
        );
      }),
      onChanged: (index) {
        setState(() {
          upperChildButtonIndex = index!;
          _update();
        });
      },
    );
  }

  Widget _lowerDropDownButton() {
    return DropdownButton<int>(
      isDense: true,
      isExpanded: true,
      underline: const SizedBox.shrink(),
      value: lowerParentButtonIndex,
      items: List<DropdownMenuItem<int>>.generate(parents.length, (index) {
        return DropdownMenuItem<int>(
          value: index,
          child: Text(parents[index].label),
        );
      }),
      onChanged: (index) {
        setState(() {
          lowerParentButtonIndex = index!;
          _update();
        });
      },
    );
  }

  void _update() {
    currentParent = parents[lowerParentButtonIndex];
    children = currentParent.children;
    currentChild = children[upperChildButtonIndex];
  }
}

///_SimpleDashboardItem
class _DashboardItem extends StatelessWidget {
  const _DashboardItem({
    required this.caption,
    this.title,
    this.subtitle,
    this.child,
    this.heroId,
    this.extendedChild,
  });

  final String caption;
  final String? title;
  final String? subtitle;
  final Widget? child;
  final UniqueKey? heroId;
  final Widget? extendedChild;

  void _onTap(BuildContext context) {
    if (extendedChild != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => DashboardPage(
            detailedWidget: extendedChild,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _DashboardCard(
      onTap: () => _onTap(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _customCaption(context),
          const SizedBox(height: DashboardPage._distBetweenItems),
          if (title != null) _customTitle(context),
          if (subtitle != null) _customSubtitle(context),
          if (child != null)
            const SizedBox(height: DashboardPage._distBetweenItems),
          if (child != null) Hero(tag: heroId!, child: child!),
        ],
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
      title!,
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
