import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/settings.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/custom_textfield.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/register.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class LoginPage extends StatelessWidget {
  final String email = 'name@domain.de';
  final String password = '******';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Login'),
      body: Container(
        padding: const EdgeInsets.only(top: 16.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            const CustomWidget(
              labelText: 'Email',
              placeholder: 'name@domain.com',
            ),
            const CustomWidget(labelText: 'Passwort', placeholder: '******'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Settings()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'LOGIN',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('oder'),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'REGISTRIEREN',
                    style: Theme.of(context).textTheme.bodyText2,
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
