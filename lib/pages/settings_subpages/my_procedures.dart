import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/mocked_data/mocked_selected_procedure_service.dart';
import 'package:swp_direktdem_verf_app/pages/new_procedure.dart';
import 'package:swp_direktdem_verf_app/widgets/home/foldable_filter_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/home/overview_procedure_view.dart';
import 'package:swp_direktdem_verf_app/widgets/home/search_app_bar.dart';
import 'package:swp_direktdem_verf_app/pages/NewProcedure1.dart';


class MyProcedures extends StatelessWidget {
  const MyProcedures();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(title: 'Meine Verfahren', onSearch: onSearch),
      floatingActionButton:
          const _TransitionFloatingActionButton(openChild: NewProcedurePage()),
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
          items: MockedSelectedProcedureService.getMyProcedures(),
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

class _TransitionFloatingActionButton extends StatelessWidget {
  const _TransitionFloatingActionButton({required this.openChild});

  final Widget openChild;

  ///Style
  static const double _floatingActionButtonSize = 56.0;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fade,
      openBuilder: (BuildContext context, VoidCallback _) => openChild,
      closedElevation: 6.0,
      closedShape: _roundShape(),
      closedColor: Theme.of(context).colorScheme.primary,
      closedBuilder: (BuildContext context, VoidCallback openContainer) =>
          _floatingActionButton(context, openContainer),
    );
  }

  RoundedRectangleBorder _roundShape() {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(_floatingActionButtonSize / 2),
      ),
    );
  }

  Widget _floatingActionButton(BuildContext context, VoidCallback openC) {
    return SizedBox(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NewProcedure1()),
        );
      },
      height: _floatingActionButtonSize,
      width: _floatingActionButtonSize,
      child: IconButton(
        color: Theme.of(context).colorScheme.onPrimary,
        onPressed: openC,
        icon: const Icon(Icons.add),
      ),
    );
  }
}
