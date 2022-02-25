import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/categories.dart';

class FoldableFilterBar extends StatefulWidget {
  const FoldableFilterBar({required this.onFilter});

  final Function(FilterOptions option) onFilter;

  @override
  _FoldableFilterBarState createState() => _FoldableFilterBarState();
}

class _FoldableFilterBarState extends State<FoldableFilterBar> {
  String _filterText = FilterOptions.filterToOption(null).title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: _customText(_filterText),
      iconTheme: _customIconTheme(),
      actions: [
        _CustomDropdownButton(onChanged: _onFilter),
      ],
    );
  }

  IconThemeData _customIconTheme() {
    return Theme.of(context).iconTheme.copyWith(
          color: Theme.of(context).colorScheme.primary,
        );
  }

  Widget _customText(String text) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .subtitle1
          ?.copyWith(color: Theme.of(context).colorScheme.primary),
    );
  }

  void _onFilter(FilterOptions filter) {
    setState(() => _filterText = filter.title);
    widget.onFilter(filter);
  }
}

enum Direction {
  ascending,
  descending,
}

class _AnimatedArrowIcon extends StatefulWidget {
  const _AnimatedArrowIcon({required this.onTap});

  final Function(Direction direction) onTap;

  @override
  _AnimatedArrowIconState createState() => _AnimatedArrowIconState();
}

class _AnimatedArrowIconState extends State<_AnimatedArrowIcon>
    with SingleTickerProviderStateMixin {
  Direction direction = Direction.descending;

  ///For animation
  late AnimationController controller;
  late Animation<double> animation;

  void setRotation() {
    animation = direction == Direction.descending
        ? Tween<double>(begin: 0, end: pi).animate(controller)
        : Tween<double>(begin: pi, end: 2 * pi).animate(controller);
  }

  void setController() {
    controller = AnimationController(
      vsync: this,
      duration: kThemeAnimationDuration,
    );
  }

  @override
  void initState() {
    setController();
    setRotation();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: IconButton(
        onPressed: onTap,
        icon: const Icon(Icons.arrow_upward),
      ),
      builder: (context, child) {
        return Transform.rotate(
          angle: animation.value,
          child: child,
        );
      },
    );
  }

  void onTap() {
    setState(() {
      widget.onTap(direction);
      setRotation();
      controller.forward(from: 0);
      swapDirection();
    });
  }

  void swapDirection() {
    direction = direction == Direction.ascending
        ? Direction.descending
        : Direction.ascending;
  }
}

/// Filters
class FilterOptions {
  FilterOptions({required this.title, required this.filter});

  factory FilterOptions.filterToOption(ProcedureCategory? filter) {
    switch (filter) {
      case null:
        return FilterOptions(title: 'Alle', filter: filter);
      case ProcedureCategory.unknown:
        return FilterOptions(title: 'Unbekannt', filter: filter);
      case ProcedureCategory.demokratie_stateorganisation_domesticPolitics:
        return FilterOptions(
          title: 'Demokratie, Staatsorganisation und Innenpolitik',
          filter: filter,
        );
      case ProcedureCategory.economy:
        return FilterOptions(title: 'Wirtschaft', filter: filter);
      case ProcedureCategory.educationAndCulture:
        return FilterOptions(title: 'Bildung und Kultur', filter: filter);
      case ProcedureCategory.health_Enviromentprotection_Consumerprotection:
        return FilterOptions(
          title: 'Gesundheit, Umwelt- und Verbraucherschutz',
          filter: filter,
        );
      case ProcedureCategory.miscellaneous:
        return FilterOptions(title: 'Sonstiges', filter: filter);
      case ProcedureCategory.social:
        return FilterOptions(title: 'Soziales', filter: filter);
      case ProcedureCategory.traffic:
        return FilterOptions(title: 'Verkehr', filter: filter);
    }
  }

  final String title;
  final ProcedureCategory? filter;

  static List<FilterOptions> getAllFilters() {
    return [FilterOptions.filterToOption(null)].followedBy(
      ProcedureCategory.values.map<FilterOptions>((ProcedureCategory? filter) {
        return FilterOptions.filterToOption(filter);
      }),
    ).toList();
  }
}

class _CustomDropdownButton extends StatelessWidget {
  const _CustomDropdownButton({required this.onChanged});

  final Function(FilterOptions option) onChanged;

  ///Style
  static const String _tooltip = 'Sortierung auswählen';

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Theme.of(context).colorScheme.background,
      tooltip: _tooltip,
      icon: const Icon(Icons.menu),
      itemBuilder: (context) {
        return FilterOptions.getAllFilters()
            .map<PopupMenuEntry<dynamic>>((FilterOptions options) {
          return PopupMenuItem(
            onTap: () => onChanged(options),
            child: Text(
              options.title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          );
        }).toList();
      },
    );
  }
}
