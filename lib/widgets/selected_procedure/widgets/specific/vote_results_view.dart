import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/elementary/custom_page_view.dart';

class VoteResultsView extends StatelessWidget {
  const VoteResultsView({required this.widgetList});

  final List<Widget> widgetList;

  @override
  Widget build(BuildContext context) {
    return CustomPageView(
      widgetList: widgetList,
      pageViewHeight: 250,
    );
  }
}
