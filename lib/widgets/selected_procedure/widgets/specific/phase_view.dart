import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swp_direktdem_verf_app/config/custom_theme_data.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/elementary/timeline.dart';

class Phase {
  Phase({
    required this.title,
    required this.started,
    required this.ended,
    required this.subtitle,
    required this.progress,
    required this.completed,
  });

  final String title;
  final DateTime? started;
  final DateTime? ended;
  final String subtitle;
  final double progress;
  final bool completed;
}

class PhaseView extends StatelessWidget {
  const PhaseView({required this.phases});

  final List<Phase> phases;

  ///Style
  static const double _itemPadding = 20;
  static const double _distBetweenTexts = 2;
  static const double _distBetweenDates = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyConstants.edgeHorPagePadding,
      child: TimeLine(
        process: _widgetsToTimeLineProcess(_phasesToWidgets(context)),
      ),
    );
  }

  List<Widget> _phasesToWidgets(BuildContext context) {
    return phases.mapIndexed((index, _phase) {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: _itemPadding,
          left: _itemPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(context, _phase.title),
            const SizedBox(height: _distBetweenTexts),
            _dates(context, _phase.started, _phase.ended),
            const SizedBox(height: _distBetweenTexts),
            _subtitle(context, _phase.subtitle),
          ],
        ),
      );
    }).toList();
  }

  Widget _dates(BuildContext context, DateTime? start, DateTime? end) {
    return start == null && end == null
        ? const SizedBox.shrink()
        : Row(
            children: [
              if (start != null)
                Text(
                  'Gestarted: ${DateFormat('yyyy-MM-dd').format(start)}',
                  style: Theme.of(context).textTheme.overline,
                ),
              if (end != null) const SizedBox(width: _distBetweenDates),
              if (end != null)
                Text(
                  'beended: ${DateFormat('yyyy-MM-dd').format(end)}',
                  style: Theme.of(context).textTheme.overline,
                ),
            ],
          );
  }

  Text _title(BuildContext context, String text) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }

  Text _subtitle(BuildContext context, String text) {
    return Text(
      text,
      overflow: TextOverflow.visible,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }

  List<TimeLineProcess> _widgetsToTimeLineProcess(List<Widget> widgets) {
    return widgets.mapIndexed((index, widget) {
      return TimeLineProcess(
        state: _getTimeLineState(index),
        progress: phases[index].progress,
        child: widget,
      );
    }).toList();
  }

  TimeLineState _getTimeLineState(int index) {
    return phases[index].completed
        ? TimeLineState.done
        : phases[index].progress > 0
            ? TimeLineState.doing
            : TimeLineState.todo;
  }
}
