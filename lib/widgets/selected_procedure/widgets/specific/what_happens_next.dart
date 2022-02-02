import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/config/custom_theme_data.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/elementary/timeline.dart';

enum PageState {
  waiting,
  error,
  showcase,
}

class WhatHappensNext extends StatefulWidget {
  const WhatHappensNext({
    required this.title,
    required this.instructions,
    required this.state,
    this.indexShowCase = 0,
    this.indexError = 0,
    this.indexWaiting = 0,
  });

  final String title;
  final List<Instructions> instructions;
  final PageState state;

  //for PageState showCase (index where showCase starts)
  final int indexShowCase;

  //for PageState error (index where error occurred)
  final int indexError;

  //for PageState waiting (index where its waiting)
  final int indexWaiting;

  @override
  State<WhatHappensNext> createState() => _WhatHappensNextState();
}

class _WhatHappensNextState extends State<WhatHappensNext> {
  int currentIndex = 0;

  //TODO
  void _onContinue() {}

  ///Style
  static const double _imgSize = 50;
  static const Duration _showCaseDuration = Duration(seconds: 5);
  static const String _continueButtonText = 'Weiter';

  @override
  void initState() {
    super.initState();
    currentIndex = _getRightIndex();
    if (widget.state == PageState.showcase) {
      _incrementShowcase();
    }
  }

  Future<void> _incrementShowcase() async {
    while (currentIndex < widget.instructions.length) {
      await Future.delayed(_showCaseDuration);
      setState(() {
        currentIndex++;
      });
    }
  }

  int _getRightIndex() {
    switch (widget.state) {
      case PageState.showcase:
        return widget.indexShowCase;
      case PageState.waiting:
        return widget.indexWaiting;
      case PageState.error:
        return widget.indexError;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ListView(
          padding: MyConstants.pagePadding,
          children: [
            _title(),
            TimeLine(
              process: _widgetsToTimeLineProcess(_instructionsToWidgets()),
            ),
          ],
        ),
        _continueButton(),
      ],
    );
  }

  List<Widget> _instructionsToWidgets() {
    return widget.instructions.mapIndexed((index, ins) {
      return Opacity(
        opacity: index <= currentIndex ? 1 : 0.5,
        child: ListTile(
          leading: Image.asset(ins.asset, height: _imgSize),
          title: Text(ins.title),
          isThreeLine: true,
          subtitle: Text(
            ins.subtitle,
            overflow: TextOverflow.visible,
          ),
        ),
      );
    }).toList();
  }

  List<TimeLineProcess> _widgetsToTimeLineProcess(List<Widget> widgets) {
    return widgets.mapIndexed((index, widget) {
      return TimeLineProcess(
        state: _getState(index),
        child: widget,
      );
    }).toList();
  }

  TimeLineState _getState(int index) {
    TimeLineState _state = TimeLineState.doing;
    //get fitting TimeLineState
    switch (widget.state) {
      case PageState.showcase:
      case PageState.waiting:
        _state = TimeLineState.doing;
        break;
      case PageState.error:
        _state = TimeLineState.failed;
        break;
    }

    return index == currentIndex
        ? _state
        : index < currentIndex
            ? TimeLineState.done
            : TimeLineState.todo;
  }

  Widget _continueButton() {
    return ElevatedButton(
      onPressed: _onContinue,
      child: const Text(_continueButtonText),
    );
  }

  Widget _title() {
    return Text(
      widget.title,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(overflow: TextOverflow.visible),
    );
  }
}

class Instructions {
  Instructions({
    required this.title,
    required this.subtitle,
    required this.asset,
  });

  final String title;
  final String subtitle;
  final String asset;
}
