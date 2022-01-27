import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

///indicator for PageView
class MyPageIndicator extends StatelessWidget {
  const MyPageIndicator({
    required this.length,
    required this.currentPageNotifier,
  });

  final int length;
  final ValueNotifier<int> currentPageNotifier;

  ///Style
  static const double _dotSize = 12;
  static const double _selectedDotSize = 16;
  static const double _opacity = 0.6;

  @override
  Widget build(BuildContext context) {
    return length > 1
        ? Opacity(
            opacity: _opacity,
            child: CirclePageIndicator(
              size: _dotSize,
              selectedSize: _selectedDotSize,
              itemCount: length,
              currentPageNotifier: currentPageNotifier,
            ),
          )
        : const SizedBox.shrink();
  }
}
