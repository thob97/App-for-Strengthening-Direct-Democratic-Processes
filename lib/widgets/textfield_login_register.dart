import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldLoginRegister extends StatefulWidget {
  const TextfieldLoginRegister(
    this.labelText,
    this.placeholder,
    this.controller,
  );
  final String placeholder;
  final String labelText;
  final TextEditingController controller;
  @override
  _TextfieldLoginRegisterState createState() => _TextfieldLoginRegisterState();
}

class _TextfieldLoginRegisterState extends State<TextfieldLoginRegister> {
  bool isHidden = false;
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onListen);
    super.dispose();
  }

  void onListen() => setState(() {});
  @override
  Widget build(BuildContext context) {
    return buildTextField(
      widget.labelText,
      widget.placeholder,
      widget.controller,
    );
  }

  Widget buildTextField(
    String labelText,
    String placeholder,
    TextEditingController controller,
  ) {
    Widget child;
    if (labelText == 'Passwort' || labelText == 'Altes Passwort') {
      child = TextFormField(
        controller: controller,
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
        keyboardType: TextInputType.visiblePassword,
        autofillHints: const [AutofillHints.password],
        onEditingComplete: () => TextInput.finishAutofillContext(),
        validator: (password) => password != null && password.length < 4
            ? 'Your old password is incorrect. Enter min. 4 characters'
            : null,
      );
    } else if (labelText == 'Email') {
      child = TextFormField(
        controller: controller,
        onTap: () {},
        decoration: InputDecoration(
          labelText: '  $labelText',
          suffixIcon: widget.controller.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => widget.controller.clear(),
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
          prefixIcon: const Icon(Icons.mail),
        ),
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        onEditingComplete: () => TextInput.finishAutofillContext(),
        validator: (email) => email != null && !EmailValidator.validate(email)
            ? 'Enter a valid email'
            : null,
      );
    } else {
      child = TextFormField(
        controller: controller,
        onTap: () {},
        decoration: InputDecoration(
          labelText: '  $labelText',
          suffixIcon: widget.controller.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => widget.controller.clear(),
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
        keyboardType: TextInputType.name,
        autofillHints: const [AutofillHints.name],
        onEditingComplete: () => TextInput.finishAutofillContext(),
        validator: (password) => password != null && password.length < 4
            ? 'Your name is incorrect. Enter min. 4 characters'
            : null,
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
