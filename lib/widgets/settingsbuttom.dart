import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton(this.icon, this.title, this.onPressed);

  final IconData icon;
  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    //final _textTheme = _theme.textTheme;
    return MaterialButton(
      textColor: _theme.primaryColor,
      padding: const EdgeInsets.all(20.0),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: _theme.primaryColor,
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.keyboard_arrow_right,
              color: _theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
