import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/elementary/my_page_indicator.dart';

///like page view but uses MyPageIndicator
class CustomPageView extends StatelessWidget {
  CustomPageView({
    required this.widgetList,
    required this.pageViewHeight,
    required this.horChildPad,
  });

  final List<Widget> widgetList;
  final double pageViewHeight;
  final double horChildPad;

  //used for MyPageIndicator
  final _currentPageNotifier = ValueNotifier<int>(0);

  ///Style
  static const double _distBetweenPageAndIndicator = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _myPageView(),
        const SizedBox(height: _distBetweenPageAndIndicator),
        MyPageIndicator(
          length: widgetList.length,
          currentPageNotifier: _currentPageNotifier,
        ),
      ],
    );
  }

  Widget _myPageView() {
    return SizedBox(
      height: pageViewHeight,
      child: PageView(
        physics: const BouncingScrollPhysics(),
        onPageChanged: (int index) {
          _currentPageNotifier.value = index;
        },
        children: widgetList.map((_widget) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horChildPad),
              child: _widget,
            ),
          );
        }).toList(),
      ),
    );
  }
}
