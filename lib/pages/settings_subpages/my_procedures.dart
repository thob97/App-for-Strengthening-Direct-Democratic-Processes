import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swp_direktdem_verf_app/methods/file_from_img_url_method.dart';
import 'package:swp_direktdem_verf_app/pages/new_procedure.dart';
import 'package:swp_direktdem_verf_app/pages/selected_procedure.dart';
import 'package:swp_direktdem_verf_app/service/database_substitute.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/simple_procedure.dart';
import 'package:swp_direktdem_verf_app/service/service_database.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_future_builder.dart';
import 'package:swp_direktdem_verf_app/widgets/home/foldable_filter_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/home/overview_procedure_view.dart';
import 'package:swp_direktdem_verf_app/widgets/home/search_app_bar.dart';
import 'package:swp_direktdem_verf_app/pages/new_procedure1.dart';


class MyProcedures extends StatefulWidget {
  const MyProcedures();

  ///Style
  static const _noProceduresMsg = 'Es wurden noch keine Verfahren erstellt';

  @override
  State<MyProcedures> createState() => _MyProceduresState();
}

class _MyProceduresState extends State<MyProcedures> {
  late Future<List<ProcedureOverview>?> _procedures;

  //for filter
  late final Future<List<ProcedureOverview>?> _allProcedures = _procedures;

  @override
  void initState() {
    super.initState();
    _procedures = _getProcedures();
  }

  Future<List<SimpleProcedure>?> _getDataBaseData() async {
    return Provider.of<ServiceDataBase>(context, listen: false)
        .getOwnEditorProcedures();
  }

  Future<List<ProcedureOverview>?> _getProcedures() async {
    final List<SimpleProcedure>? _items = await _getDataBaseData();
    if (_items == null) return null;

    //for error handling
    if (!mounted) return Future.delayed(Duration.zero, () => null);
    final bool _isLoggedIn =
        Provider.of<ServiceDataBase>(context, listen: false).userIsLoggedIn();

    final List<ProcedureOverview> _res = [];
    for (final SimpleProcedure _sP in _items) {
      final File _imgFile = await fileFromImageUrl(
        DatabaseSubstitute.getProcedureImg(procedureId: _sP.id),
        _sP.id,
      );
      _res.add(
        ProcedureOverview(
          id: _sP.id,
          title: _sP.title,
          img: _imgFile,
          subtitle: _sP.description,
          success: _sP.success,
          phaseState: _sP.lastCompletedPhase,
          transitionItems: TransitionItems(
            //TODO db: once error msg missing db gets resolved team
            showEdit: _isLoggedIn,
            //TODO db: once error msg missing db gets resolved team
            isSubscribed: false,
            //TODO db: once error msg missing db gets resolved team
            showSubscribe: _isLoggedIn,
            category: _sP.category,
            description: _sP.description,
            process: _sP.process,
            createDate: _sP.createDate,
            creatorFirstName: '${_sP.carrier?.firstName}',
            creatorLastName: '${_sP.carrier?.lastName}',
            endDate: _sP.endDate,
            organisationName: _sP.organisation?.name,
          ),
        ),
      );
    }
    return _res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(title: 'Meine Verfahren', onSearch: onSearch),
      floatingActionButton:
          const _TransitionFloatingActionButton(openChild: NewProcedurePage()),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[FoldableFilterBar(onFilter: onFilter)];
        },
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: body(context),
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    return CustomFutureBuilder(
      futureData: _procedures,
      builder: (result) {
        result as List<ProcedureOverview>;
        return result.isEmpty
            ? _noSubscribedProceduresPlaceholder()
            : OverviewProcedureView(items: result);
      },
    );
  }

  Widget _noSubscribedProceduresPlaceholder() {
    return const Center(
      child: Text(MyProcedures._noProceduresMsg),
    );
  }

  Future<void> _onRefresh() async {
    final List<ProcedureOverview>? _refreshedProcedures =
        await _getProcedures();
    setState(() {
      _procedures = Future.delayed(Duration.zero, () => _refreshedProcedures);
    });
  }

  //TODO
  void onSearch(String query) {}

  void onFilter(FilterOptions option) {
    if (option.filter == null) {
      setState(() {
        _procedures = _allProcedures;
      });
    } else {
      setState(() {
        _procedures = _allProcedures.then(
          (value) => value
              ?.where(
                (element) =>
                    element.transitionItems.category.index ==
                    option.filter!.index,
              )
              .toList(),
        );
      });
    }
  }
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
          MaterialPageRoute(builder: (context) => const new_procedure1()),
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
