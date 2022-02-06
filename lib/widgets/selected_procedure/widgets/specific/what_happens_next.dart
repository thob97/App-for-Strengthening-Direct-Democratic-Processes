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
    required this.index,
    required this.state,
  });

  factory WhatHappensNext.showcase({
    required String title,
    required List<Instructions> instructions,
  }) {
    return WhatHappensNext(
      title: title,
      instructions: instructions,
      index: 0,
      state: PageState.showcase,
    );
  }

  factory WhatHappensNext.error({
    required String title,
    required List<Instructions> instructions,
    required int index,
  }) {
    return WhatHappensNext(
      title: title,
      instructions: instructions,
      index: index,
      state: PageState.error,
    );
  }

  factory WhatHappensNext.waiting({
    required String title,
    required List<Instructions> instructions,
    required int index,
  }) {
    return WhatHappensNext(
      title: title,
      instructions: instructions,
      index: index,
      state: PageState.waiting,
    );
  }

  final String title;
  final List<Instructions> instructions;
  final int index;
  final PageState state;

  @override
  State<WhatHappensNext> createState() => _WhatHappensNextState();
}

class _WhatHappensNextState extends State<WhatHappensNext> {
  late int currentIndex;

  //TODO
  void _onContinue() {}

  ///Style
  static const double _imgSize = 50;
  static const Duration _showCaseDuration = Duration(seconds: 5);
  static const String _continueButtonText = 'Weiter';

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
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
        state: _getTimeLineState(index),
        child: widget,
      );
    }).toList();
  }

  TimeLineState _getTimeLineState(int index) {
    TimeLineState _state = TimeLineState.doing;
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
