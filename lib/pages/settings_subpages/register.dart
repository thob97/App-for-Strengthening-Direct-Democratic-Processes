import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/custom_textfield.dart';
import 'package:swp_direktdem_verf_app/utils/user_preferences.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
            CustomWidget(
              labelText: 'Vorname',
              placeholder: UserPreferences.myUser.name.split(' ').first,
            ),
            CustomWidget(
              labelText: 'Nachname',
              placeholder: UserPreferences.myUser.name.split(' ').last,
            ),
            CustomWidget(
              labelText: 'Email',
              placeholder: UserPreferences.myUser.email,
            ),
            const CustomWidget(
              labelText: 'Passwort',
              placeholder: '******',
            ),
            const CustomWidget(
              labelText: 'Passwort wiederholen',
              placeholder: '******',
            ),
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
}
