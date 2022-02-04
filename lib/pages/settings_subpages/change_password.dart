import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/profilesettings.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/usermodel.dart';
import 'package:swp_direktdem_verf_app/utils/user_preferences.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/textfield_login_register.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage(this.user, {Key? key}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Passwort ändern'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 16.0,
          left: 10.0,
          right: 10.0,
          bottom: 10.0,
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              const TextfieldLoginRegister(
                'Altes Passwort',
                'Altes Passwort',
              ),
              const SizedBox(height: 10),
              Text(
                'Neues Passwort',
                style: Theme.of(context).textTheme.headline2?.apply(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 10),
              const TextfieldLoginRegister(
                'Passwort',
                'Passwort',
              ),
              const TextfieldLoginRegister(
                'Passwort wiederholen',
                'Passwort wiederholen',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfilePage(
                            UserPreferences.myUser,
                          ),
                        ),
                      );
                    },
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text(
                      'ABBRECHEN',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text(
                      'SPEICHERN',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
