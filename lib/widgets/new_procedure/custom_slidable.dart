import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomSlidable extends StatelessWidget {
  const CustomSlidable({
    required this.child,
    required this.onDelete,
    required this.onHide,
    this.enabled = true,
  });

  final Widget child;
  final VoidCallback onDelete;
  final VoidCallback onHide;
  final bool enabled;

  ///Style
  static const String _hideLabel = 'Hide';
  static const String _deleteLabel = 'Delete';
  static const IconData _hideIcon = Icons.remove_red_eye;
  static const IconData _deleteIcon = Icons.delete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      enabled: enabled,
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => onHide(),
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            icon: _hideIcon,
            label: _hideLabel,
          ),
          SlidableAction(
            onPressed: (context) => onDelete(),
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            icon: _deleteIcon,
            label: _deleteLabel,
          ),
        ],
      ),
      child: child,
    );
  }
}
