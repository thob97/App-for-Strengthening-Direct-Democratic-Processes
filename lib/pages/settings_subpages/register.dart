import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/profilepage.dart';
import 'package:swp_direktdem_verf_app/pages/utils/user_preferences.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';
import 'package:swp_direktdem_verf_app/service/service_mocked.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/password_confirm.dart';
import 'package:swp_direktdem_verf_app/widgets/textfield_login_register.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
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

  // Get json result and convert it to model. Then add
  Future<void> getUserDetails() async {
    final String response = await rootBundle.loadString(path);
    final responseJson = await json.decode(response);

    setState(() {
      for (final Map user in responseJson) {
        _userDetails.add(User.fromJson(user.cast()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getUserDetails();
    _userDetails.clear();
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
                            builder: (context) =>
                                ProfilePage(_searchResult.first),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
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
    ServiceMocked().putUser(
      12345,
      User(
        first_name: controllerFirstName.text,
        password: passController.text,
        id: 112345,
        last_login: null,
        is_active: true,
        is_superuser: false,
        date_joined: DateTime.now(),
        email: controllerEmail.text,
        last_name: controllerLastName.text,
        is_staff: false,
      ),
    );
    User(
      first_name: controllerFirstName.text,
      password: passController.text,
      id: 112345,
      last_login: null,
      is_active: true,
      is_superuser: false,
      date_joined: DateTime.now(),
      email: controllerEmail.text,
      last_name: controllerLastName.text,
      is_staff: false,
    ).toJson();
    _searchResult.add(
      User(
        first_name: controllerFirstName.text,
        password: passController.text,
        id: 12345,
        last_login: null,
        is_active: true,
        is_superuser: false,
        date_joined: DateTime.now(),
        email: controllerEmail.text,
        last_name: controllerLastName.text,
        is_staff: false,
      ),
    );
  }
}

List<User> _searchResult = [];

List<User> _userDetails = [];

const String path = 'assets/mocked_data/user.json';
