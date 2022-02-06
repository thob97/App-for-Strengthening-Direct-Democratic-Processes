import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/mocked_data/mocked_selected_procedure_service.dart';
import 'package:swp_direktdem_verf_app/widgets/animated_bottom_navigation_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/home/foldable_filter_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/home/overview_procedure_view.dart';
import 'package:swp_direktdem_verf_app/widgets/home/search_app_bar.dart';

class Home extends StatelessWidget {
  const Home();

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
        body: OverviewProcedureView(
          items: MockedSelectedProcedureService.getAllProcedures(),
        ),
      ),
    );
  }

  //TODO
  void onSearch(String query) {}

  //TODO
  void onDirection(Direction direction) {}

  //TODO
  void onFilter(FilterOptions option) {}
}
