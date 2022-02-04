import 'package:flutter/material.dart';

class TextfieldLoginRegister extends StatefulWidget {
  const TextfieldLoginRegister(this.labelText, this.placeholder);
  final String placeholder;
  final String labelText;
  @override
  _TextfieldLoginRegisterState createState() => _TextfieldLoginRegisterState();
}

class _TextfieldLoginRegisterState extends State<TextfieldLoginRegister> {
  bool isHidden = false;
  @override
  Widget build(BuildContext context) {
    return buildTextField(widget.labelText, widget.placeholder);
  }

  Widget buildTextField(
    String labelText,
    String placeholder,
  ) {
    Widget child;
    if (labelText == 'Passwort' ||
        labelText == 'Passwort wiederholen' ||
        labelText == 'Altes Passwort') {
      child = TextFormField(
        onTap: () {},
        obscureText: isHidden,
        decoration: InputDecoration(
          labelText: '  $labelText',
          suffixIcon: IconButton(
            icon: isHidden
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            onPressed: togglePasswordVisibility,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          labelStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      child = TextFormField(
        onTap: () {},
        decoration: InputDecoration(
          labelText: '  $labelText',
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          labelStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.only(
        bottom: 35.0,
      ),
      child: SizedBox(
        height: 60,
        width: 350,
        child: child,
      ),
    );
  }

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
}
