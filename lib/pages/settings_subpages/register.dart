import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/utils/user_preferences.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool showPassword = true;
  bool showConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Registrieren'),
      body: Container(
        padding: const EdgeInsets.only(top: 16.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            buildTextField(
              'Vorname',
              UserPreferences.myUser.name.split(' ').first,
            ),
            buildTextField(
              'Nachname',
              UserPreferences.myUser.name.split(' ').last,
            ),
            buildTextField('Email', UserPreferences.myUser.email),
            buildTextField('Passwort', '******'),
            buildTextField('Passwort wiederholen', '******'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    primary: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'REGISTRIEREN',
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
    String labelText,
    String placeholder,
  ) {
    Widget child;
    if (labelText == 'Passwort') {
      child = TextField(
        autofocus: true,
        onTap: () {},
        obscureText: showPassword,
        decoration: InputDecoration(
          labelText: '  $labelText',
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
          hintText: '  $placeholder',
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
    } else if (labelText == 'Passwort wiederholen') {
      child = TextField(
        onTap: () {},
        obscureText: showConfirmPassword,
        decoration: InputDecoration(
          labelText: '  $labelText',
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
          hintText: '  $placeholder',
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
          labelText: '  $labelText',
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: '  $placeholder',
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
