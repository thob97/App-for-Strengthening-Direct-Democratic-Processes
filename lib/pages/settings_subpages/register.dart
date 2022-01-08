import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/utils/user_preferences.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool showPassword = false;

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
            buildTextField('Vorname', UserPreferences.myUser.name.split(' ').first, false),
            buildTextField('Nachname', UserPreferences.myUser.name.split(' ').last, false),
            buildTextField('Email', UserPreferences.myUser.email, false),
            buildTextField('Passwort', '******', true),
            buildTextField('Passwort wiederholen', '******', true),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  primary: ColorScheme.light().primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))
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
      String labelText, String placeholder, bool isPasswordTextField) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(
          bottom: 35.0,
        ),
        child: SizedBox(
          height: 60,
          width: 350,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              autofocus: false,
              onTap: () {},
              obscureText: isPasswordTextField ? showPassword : false,
              decoration: InputDecoration(
                  suffix: isPasswordTextField
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: const Icon(
                            Icons.remove_red_eye,
                          ),
                        )
                      : null,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                  ),
                  contentPadding: const EdgeInsets.only(bottom: 3),
                  labelText: '  ' + labelText,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: '  ' + placeholder,
                  labelStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  hintStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ),
      )
    ]);
  }
}
