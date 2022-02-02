import 'dart:math';

import 'package:flutter/material.dart';

class FoldableFilterBar extends StatefulWidget {
  const FoldableFilterBar({required this.onDirection, required this.onFilter});

  final Function(Direction direction) onDirection;
  final Function(FilterOptions option) onFilter;

  @override
  _FoldableFilterBarState createState() => _FoldableFilterBarState();
}

class _FoldableFilterBarState extends State<FoldableFilterBar> {
  String _filterText = FilterOptions.filterToOption(Filter.name).title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: _customText(_filterText),
      iconTheme: _customIconTheme(),
      actions: [
        _AnimatedArrowIcon(onTap: widget.onDirection),
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

///Add enum entry here for more Filters
enum Filter {
  startDate,
  endDate,
  name,
  phaseState,
}

class FilterOptions {
  FilterOptions({required this.title, required this.filter});

  factory FilterOptions.filterToOption(Filter filter) {
    switch (filter) {
      case Filter.startDate:
        return FilterOptions(title: 'Start Datum', filter: filter);
      case Filter.name:
        return FilterOptions(title: 'Namen', filter: filter);
      case Filter.phaseState:
        return FilterOptions(title: 'Stufe', filter: filter);
      case Filter.endDate:
        return FilterOptions(title: 'End Datum', filter: filter);
    }
  }

  final String title;
  final Filter filter;

  static List<FilterOptions> getAllFilters() {
    return Filter.values.map<FilterOptions>((Filter filter) {
      return FilterOptions.filterToOption(filter);
    }).toList();
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
