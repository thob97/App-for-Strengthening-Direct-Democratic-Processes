import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swp_direktdem_verf_app/pages/settings.dart';
import 'package:swp_direktdem_verf_app/pages/utils/user_preferences.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/password_confirm.dart';
import 'package:swp_direktdem_verf_app/widgets/textfield_login_register.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage(
    this.users, {
    Key? key,
  }) : super(key: key);
  final List<User> users;
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();
  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerEmail = TextEditingController();
  final passController = TextEditingController();
  final passConfCcontroller = TextEditingController();
  late User user;
  @override
  void dispose() {
    controllerFirstName.dispose();
    controllerLastName.dispose();
    controllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Registrieren'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16.0),
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 15,
                ),
                TextfieldLoginRegister(
                  'Vorname',
                  UserPreferences().myUser.first_name,
                  controllerFirstName,
                ),
                TextfieldLoginRegister(
                  'Nachname',
                  UserPreferences().myUser.last_name,
                  controllerLastName,
                ),
                TextfieldLoginRegister(
                  'Email',
                  UserPreferences().myUser.email,
                  controllerEmail,
                ),
                PasswordFieldWidget(
                  passController: passController,
                  confPassController: passConfCcontroller,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      final form = _formkey.currentState!;
                      onInputTextChanged();
                      if (form.validate() && _searchResult.isNotEmpty) {
                        TextInput.finishAutofillContext();
                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Die Registrierung ist erfolgreich registriert',
                              ),
                            ),
                          );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Settings(
                              user: _searchResult.first,
                              pressGeoON: true,
                              users: widget.users,
                            ),
                          ),
                        );
                      } else {
                        TextInput.finishAutofillContext();

                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Die Registrierung ist fehlgeschlagen',
                              ),
                            ),
                          );
                      }
                    }
                  },
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
      ),
    );
  }

  Future<void> onInputTextChanged() async {
    _searchResult.clear();
    for (final user in widget.users) {
      if (controllerEmail.text == user.email &&
          passController.text == user.password) {
        _searchResult.add(user);
      }
    }
  }
}

List<User> _searchResult = [];
