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
            TextFormField(
              controller: widget.passController,
              obscureText: isHidden1,
              decoration: InputDecoration(
                hintText: 'Passwort',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: IconButton(
                  icon: isHidden1
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onPressed: togglePasswordVisibility1,
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              autofillHints: const [AutofillHints.password],
              onEditingComplete: () => TextInput.finishAutofillContext(),
              validator: (password) {
                if (password!.isEmpty) {
                  return 'Bitte das Passwort eingeben';
                } else if (password.length < 8) {
                  return 'Das Passwort muss mindestens 8 Zeichen lang sein';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: widget.confPassController,
              obscureText: isHidden2,
              decoration: InputDecoration(
                hintText: 'Bitte geben Sie Ihr Passwort erneut ein',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: IconButton(
                  icon: isHidden2
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onPressed: togglePasswordVisibility2,
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              autofillHints: const [AutofillHints.password],
              onEditingComplete: () => TextInput.finishAutofillContext(),
              validator: (password) {
                if (password!.isEmpty) {
                  return 'Bitte geben Sie Ihr Passwort erneut ein';
                } else if (password.length < 8) {
                  return 'Das Passwort muss mindestens  8 Zeichen lang sein';
                } else if (password != widget.passController.text) {
                  return 'Das Passwort muss dasselbe sein wie oben';
                } else {
                  return null;
                }
              },
            ),
          ],
        ),
      );
}
