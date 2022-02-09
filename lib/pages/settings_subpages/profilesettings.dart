import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/change_password.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/profilepage.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/usermodel.dart';
import 'package:swp_direktdem_verf_app/utils/user_preferences.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/textfield_login_register.dart';
import 'package:swp_direktdem_verf_app/widgets/two_butts_in_row.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage(this.user, {Key? key}) : super(key: key);
  final User user;

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  _EditProfilePageState();

  final _formkey = GlobalKey<FormState>();
  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  void dispose() {
    controllerFirstName.dispose();
    controllerLastName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const bool switchValue = false;
    return Scaffold(
      appBar: const CustomAppBar('Profileinstellungen'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16.0),
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextfieldLoginRegister(
                  'Vorname',
                  UserPreferences.myUser.name.split(' ').first,
                  controllerFirstName,
                ),
                TextfieldLoginRegister(
                  'Nachname',
                  UserPreferences.myUser.name.split(' ').last,
                  controllerLastName,
                ),
                TextfieldLoginRegister(
                  'Email',
                  UserPreferences.myUser.email,
                  controllerEmail,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ChangePasswordPage(UserPreferences.myUser),
                      ),
                    );
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: Text(
                    'PASSWORT ÄNDERN',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Email Adresse sichtbar machen',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Switch(
                      value: switchValue,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TwoButtInRow(
                  buttonNameOne: 'Abbrechen',
                  buttonNameTwo: 'Speichern',
                  functionOne: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ProfilePage(UserPreferences.myUser),
                      ),
                    );
                  },
                  functionTwo: () async {
                    final form = _formkey.currentState!;

                    if (form.validate()) {
                      TextInput.finishAutofillContext();

                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(
                            content: Text('Ihre Daten werden gespeichert'),
                          ),
                        );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ProfilePage(UserPreferences.myUser),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Ihre Daten können nicht gespeichert werden. Überprüfen Sie sie',
                            ),
                          ),
                        );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
