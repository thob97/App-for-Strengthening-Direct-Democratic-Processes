import 'package:flutter/material.dart';

class CustomWidget extends StatefulWidget {
  const CustomWidget({
    required this.labelText,
    required this.placeholder,
  });

  final String labelText;
  final String placeholder;

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  bool showPassword = true;
  bool showConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (widget.labelText == 'Passwort') {
      child = TextField(
        onTap: () {},
        obscureText: showPassword,
        decoration: InputDecoration(
          labelText: '  ${widget.labelText}',
          suffixIcon: IconButton(
            icon: const Icon(Icons.remove_red_eye),
            onPressed: () => setState(
              () => showPassword = !showPassword,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: '  ${widget.placeholder}',
          labelStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          hintStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else if (widget.labelText == 'Passwort wiederholen') {
      child = TextField(
        onTap: () {},
        obscureText: showConfirmPassword,
        decoration: InputDecoration(
          labelText: '  ${widget.labelText}',
          suffixIcon: IconButton(
            icon: const Icon(Icons.remove_red_eye),
            onPressed: () => setState(
              () => showConfirmPassword = !showConfirmPassword,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: '  ${widget.placeholder}',
          labelStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          hintStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      child = TextField(
        onTap: () {},
        decoration: InputDecoration(
          labelText: '  ${widget.labelText}',
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: '  ${widget.placeholder}',
          labelStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          hintStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 35.0,
          ),
          child: SizedBox(
            height: 60,
            width: 350,
            child: child,
          ),
        ),
      ],
    );
  }
}
