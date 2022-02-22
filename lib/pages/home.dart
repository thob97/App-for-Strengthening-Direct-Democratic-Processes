import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swp_direktdem_verf_app/mocked_data/mocked_selected_procedure_service.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/simple_procedure.dart';
import 'package:swp_direktdem_verf_app/service/service.dart';
import 'package:swp_direktdem_verf_app/widgets/animated_bottom_navigation_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/home/foldable_filter_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/home/overview_procedure_view.dart';
import 'package:swp_direktdem_verf_app/widgets/home/search_app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State {
  List<SimpleProcedure> allProcedures = <SimpleProcedure>[];
  List<ProcedureOverview> allProcedureOverviews = <ProcedureOverview>[];
  List<ProcedureOverview> shownProcedureOverviews = <ProcedureOverview>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(title: 'Home', onSearch: onSearch),
      bottomNavigationBar: const AnimatedNavBar(selectedIndex: 0),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            FoldableFilterBar(
              onDirection: onDirection,
              onFilter: onFilter,
            )
          ];
        },
        body: FutureBuilder<List<SimpleProcedure>?>(
          future: getProcedures(context),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<SimpleProcedure>?> snapshot,
          ) {
            if (snapshot.hasData) {
              allProcedures = snapshot.data!;
              if (allProcedures.isNotEmpty) {
                for (final SimpleProcedure procedure in allProcedures) {
                  allProcedureOverviews.add(
                    ProcedureOverview(
                      title: procedure.title,
                      description: procedure.description,
                      state: procedure.lastCompletedPhase,
                      // TODO
                      img: '',
                    ),
                  );
                }
              }
            }
            //TODO ändern (nur zum Testen)
            allProcedureOverviews = allProcedureOverviews.isEmpty
                ? MockedSelectedProcedureService.getAllProcedures()
                : allProcedureOverviews;
            shownProcedureOverviews = allProcedureOverviews;
            return OverviewProcedureView(
              items: shownProcedureOverviews,
            );
            //items: MockedSelectedProcedureService.getAllProcedures(),
          },
        ),
      ),
    );
  }

  Future<List<SimpleProcedure>?> getProcedures(BuildContext context) async {
    return Provider.of<Service>(context, listen: false)
        .getAllVisibleSimpleProcedures();
  }

  //TODO
  void onSearch(String query) {
    final List<ProcedureOverview> filtered = allProcedureOverviews
        .where((pro) => pro.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      shownProcedureOverviews.clear();
      shownProcedureOverviews.addAll(filtered);
    });
  }

  //TODO
  void onDirection(Direction direction) {}

  //TODO
  void onFilter(FilterOptions option) {}
}
