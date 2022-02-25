import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swp_direktdem_verf_app/methods/file_from_img_url_method.dart';
import 'package:swp_direktdem_verf_app/pages/selected_procedure.dart';
import 'package:swp_direktdem_verf_app/service/database_substitute.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/simple_procedure.dart';
import 'package:swp_direktdem_verf_app/service/service_database.dart';
import 'package:swp_direktdem_verf_app/widgets/animated_bottom_navigation_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_future_builder.dart';
import 'package:swp_direktdem_verf_app/widgets/home/foldable_filter_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/home/overview_procedure_view.dart';
import 'package:swp_direktdem_verf_app/widgets/home/search_app_bar.dart';

class Home extends StatefulWidget {
  const Home();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<ProcedureOverview>?> _procedures;

  @override
  void initState() {
    super.initState();
    _procedures = _getProcedures();
  }

  Future<List<SimpleProcedure>?> _getDataBaseData() async {
    return Provider.of<ServiceDataBase>(context, listen: false)
        .getAllVisibleSimpleProcedures();
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
          subtitle: _sP.subtitle,
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
        return OverviewProcedureView(
          items: result as List<ProcedureOverview>,
        );
      },
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

  //TODO
  void onDirection(Direction direction) {}

  //TODO
  void onFilter(FilterOptions option) {}
}
