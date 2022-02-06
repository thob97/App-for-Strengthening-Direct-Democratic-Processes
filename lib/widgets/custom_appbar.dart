import 'package:flutter/material.dart';

//here we can customize the AppBar widget!
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return AppBar(
      title: Text(
        title,
        style: _theme.textTheme.headline5
            ?.copyWith(color: _theme.colorScheme.onPrimary),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
