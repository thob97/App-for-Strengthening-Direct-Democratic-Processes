import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

enum TimeLineState {
  done,
  doing,
  todo,
  failed,
}

class TimeLineProcess {
  TimeLineProcess({
    required this.child,
    required this.state,
    this.progress,
  });

  final Widget child;
  final TimeLineState state;
  final double? progress;
}

class TimeLine extends StatelessWidget {
  const TimeLine({required this.process});

  final List<TimeLineProcess> process;

  ///Style
  static const double _indicatorSize = 30;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: process.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        final _currentProcess = process[index];
        return TimelineTile(
          isFirst: index == 0,
          isLast: index == process.length - 1,
          beforeLineStyle: _beforeLineStyle(_currentProcess.state),
          afterLineStyle: _afterLineStyle(_currentProcess.state),
          indicatorStyle: IndicatorStyle(
            width: TimeLine._indicatorSize,
            height: TimeLine._indicatorSize,
            indicator: _indicator(_currentProcess, index),
          ),
          endChild: _currentProcess.child,
        );
      },
    );
  }

  Widget _indicator(TimeLineProcess process, int index) {
    switch (process.state) {

      ///
      case TimeLineState.done:
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF2ACA8E),
          ),
          child: const Icon(Icons.check, color: Colors.white),
        );

      ///
      case TimeLineState.doing:
        return process.progress != null
            ? _ProgressContainer(
                backgroundColor: const Color(0xFF747888),
                progress: process.progress!,
                progressColor: const Color(0xFF2ACA8E),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            : const _CircularProgressIndicatorContainer(
                backgroundColor: Color(0xFF2ACA8E),
                strokeColor: Colors.white,
              );

      ///
      case TimeLineState.todo:
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF747888),
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );

      ///
      case TimeLineState.failed:
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: const Icon(
            CommunityMaterialIcons.exclamation,
            color: Colors.white,
          ),
        );
    }
  }

  LineStyle _beforeLineStyle(TimeLineState state) {
    switch (state) {
      case TimeLineState.done:
      case TimeLineState.doing:
      case TimeLineState.failed:
        return const LineStyle(color: Colors.green);
      case TimeLineState.todo:
        return const LineStyle();
    }
  }

  LineStyle _afterLineStyle(TimeLineState state) {
    switch (state) {
      case TimeLineState.done:
        return const LineStyle(color: Colors.green);
      case TimeLineState.todo:
      case TimeLineState.doing:
      case TimeLineState.failed:
        return const LineStyle();
    }
  }
}

///new class

class _ProgressContainer extends StatelessWidget {
  const _ProgressContainer({
    required this.backgroundColor,
    required this.progressColor,
    required this.progress,
    required this.child,
  });

  final Color backgroundColor;
  final Color progressColor;
  final double progress;
  final Widget child;

  ///init for gradient
  List<Color> get gradient => [
        backgroundColor,
        backgroundColor,
        progressColor,
        progressColor,
      ];

  double get stopFill => 1 - progress;

  List<double> get stops => [0.0, stopFill, stopFill, 1.0];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: gradient,
          stops: stops,
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: child,
    );
  }
}

class _CircularProgressIndicatorContainer extends StatelessWidget {
  const _CircularProgressIndicatorContainer({
    required this.backgroundColor,
    required this.strokeColor,
  });

  final Color backgroundColor;
  final Color strokeColor;

  ///style
  static const double _padding = 6;
  static const double _stokeWidth = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(_padding),
          child: CircularProgressIndicator(
            strokeWidth: _stokeWidth,
            valueColor: AlwaysStoppedAnimation<Color>(strokeColor),
          ),
        ),
      ),
    );
  }
}
