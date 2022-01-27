import 'package:flutter/material.dart';

class DecisionDescription extends StatelessWidget {
  const DecisionDescription({
    required this.titleContent,
    required this.descriptionContent,
  });

  final String titleContent;
  final String descriptionContent;

  ///Style
  static const double _horPad = 32;
  static const double _distanceBetweenTitleAndDescription = 8;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _horPad),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _myTitle(context),
            const SizedBox(height: _distanceBetweenTitleAndDescription),
            _myDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _myTitle(BuildContext context) {
    return Text(
      titleContent,
      style: Theme.of(context).textTheme.headline5,
      maxLines: 1,
    );
  }

  Widget _myDescription(BuildContext context) {
    return Flexible(
      child: Text(
        descriptionContent,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.fade,
      ),
    );
  }
}
