import 'package:flutter/material.dart';

class LegendItem {
  const LegendItem({required this.circleColor, required this.text});

  final Color circleColor;
  final String text;
}

class Legend extends StatelessWidget {
  const Legend({required this.items});

  final List<LegendItem> items;

  ///Style
  static const double _leadingCircleRadius = 4.5;
  static const double _distBetweenCircleAndText = 8;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((LegendItem _item) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _leadingCircle(_item.circleColor),
              const SizedBox(width: _distBetweenCircleAndText),
              _legendText(context, _item.text),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _leadingCircle(Color color) {
    return Container(
      height: _leadingCircleRadius * 2,
      width: _leadingCircleRadius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  Widget _legendText(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.caption,
    );
  }
}
