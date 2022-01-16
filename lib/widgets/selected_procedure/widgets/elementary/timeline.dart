import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

///TODO take colors from theme data

class TimeLine extends StatelessWidget {
  const TimeLine({required this.process});

  final List<TimeLineProcess> process;

  ///Style
  static const double _indicatorSize = 30;
  static const double _position = 0.1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: process.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        final _currentProcess = process[index];
        return TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: _position,
          isFirst: index == 0,
          isLast: index == process.length - 1,
          beforeLineStyle: _beforeLineStyle(_currentProcess.state),
          afterLineStyle: _afterLineStyle(_currentProcess.state),
          indicatorStyle: IndicatorStyle(
            width: TimeLine._indicatorSize,
            height: TimeLine._indicatorSize,
            indicator: _indicator(_currentProcess.state, index),
          ),
          endChild: _currentProcess.child,
        );
      },
    );
  }

  Widget _indicator(TimeLineState state, int index) {
    switch (state) {

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
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF2ACA8E),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
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
  });

  final Widget child;
  final TimeLineState state;

  bool isDone() {
    return state == TimeLineState.done;
  }

  bool isTodo() {
    return state == TimeLineState.todo;
  }

  bool isDoing() {
    return state == TimeLineState.doing;
  }
}
