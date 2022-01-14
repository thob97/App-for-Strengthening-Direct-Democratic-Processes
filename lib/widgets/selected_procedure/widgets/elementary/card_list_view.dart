import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/elementary/custom_card.dart';

/// A separated ListView in Card style
class CardListView extends StatelessWidget {
  const CardListView({required this.widgetList});

  final List<Widget> widgetList;

  ///Style
  static const double _dividerHorPadding = 20;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widgetList.length,
        itemBuilder: (context, index) {
          return widgetList[index];
        },
        separatorBuilder: (context, index) {
          return customDivider(context);
        },
      ),
    );
  }

  static Widget customDivider(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: _dividerHorPadding),
      child: Divider(),
    );
  }
}
