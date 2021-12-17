import 'package:flutter/material.dart';

//here we can customize the AppBar widget!
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
    this.title,
  );

  final String title;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _themeText = _theme.textTheme;
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: _theme.primaryColor),
      ),
      centerTitle: true,
      titleTextStyle: _themeText.headline6,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
