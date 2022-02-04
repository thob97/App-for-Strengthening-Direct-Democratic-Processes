import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/utils/user_preferences.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/textfield_login_register.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              TextfieldLoginRegister(
                'Vorname',
                UserPreferences.myUser.name.split(' ').first,
              ),
              TextfieldLoginRegister(
                'Nachname',
                UserPreferences.myUser.name.split(' ').last,
              ),
              TextfieldLoginRegister('Email', UserPreferences.myUser.email),
              const TextfieldLoginRegister('Passwort', '******'),
              const TextfieldLoginRegister('Passwort wiederholen', '******'),
              ElevatedButton(
                onPressed: () {},
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
        ),
      ),
    );
  }
}
