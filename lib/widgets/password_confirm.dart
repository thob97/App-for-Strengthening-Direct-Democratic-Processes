import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordFieldWidget extends StatefulWidget {
  const PasswordFieldWidget({
    Key? key,
    required this.passController,
    required this.confPassController,
  }) : super(key: key);
  final TextEditingController passController;
  final TextEditingController confPassController;
  @override
  _PasswordFieldWidgetState createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool isHidden1 = false;
  bool isHidden2 = false;
  void togglePasswordVisibility1() => setState(() => isHidden1 = !isHidden1);
  void togglePasswordVisibility2() => setState(() => isHidden2 = !isHidden2);
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                bottom: 35.0,
              ),
              child: SizedBox(
                height: 60,
                width: 350,
                child: TextFormField(
                  controller: widget.passController,
                  onTap: () {},
                  obscureText: isHidden1,
                  decoration: InputDecoration(
                    labelText: '  Passwort',
                    suffixIcon: IconButton(
                      icon: isHidden1
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: togglePasswordVisibility1,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Passwort',
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  autofillHints: const [AutofillHints.password],
                  onEditingComplete: () => TextInput.finishAutofillContext(),
                  validator: (password) {
                    if (password!.isEmpty) {
                      return 'Bitte das Passwort eingeben';
                    } else if (password.length < 6) {
                      return 'Das Passwort muss mindestens 6 Zeichen lang sein';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(
                bottom: 35.0,
              ),
              child: SizedBox(
                height: 60,
                width: 350,
                child: TextFormField(
                  controller: widget.confPassController,
                  onTap: () {},
                  obscureText: isHidden2,
                  decoration: InputDecoration(
                    labelText: '  Passwort wiederholen',
                    suffixIcon: IconButton(
                      icon: isHidden2
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: togglePasswordVisibility2,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Bitte geben Sie Ihr Passwort erneut ein',
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  autofillHints: const [AutofillHints.password],
                  onEditingComplete: () => TextInput.finishAutofillContext(),
                  validator: (password) {
                    if (password!.isEmpty) {
                      return 'Bitte geben Sie Ihr Passwort erneut ein';
                    } else if (password.length < 6) {
                      return 'Das Passwort muss mindestens  6 Zeichen lang sein';
                    } else if (password != widget.passController.text) {
                      return 'Das Passwort muss dasselbe sein wie oben';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      );
}
