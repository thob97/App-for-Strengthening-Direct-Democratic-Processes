import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swp_direktdem_verf_app/pages/settings.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/register.dart';
import 'package:swp_direktdem_verf_app/pages/utils/user_preferences.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/textfield_login_register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late User user;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
      appBar: const CustomAppBar('Login'),
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
                  'Email',
                  UserPreferences().myUser.email,
                  emailController,
                ),
                TextfieldLoginRegister(
                  'Passwort',
                  UserPreferences().myUser.password,
                  passwordController,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      final form = _formkey.currentState!;
                      onInputTextChanged();
                      if (form.validate() && _searchResult.isNotEmpty) {
                        {
                          //User.fromJson('assets/mocked_data/user.json').id = ServiceMocked().authenticate(email: emailController.text, password: passwordController.text);
                          TextInput.finishAutofillContext();
                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(
                              const SnackBar(
                                content: Text('Erfolgreich eingeloggt'),
                              ),
                            );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Settings(
                                pressGeoON: true,
                                user: _searchResult.first,
                              ),
                            ),
                          );
                        }
                      } else {
                        TextInput.finishAutofillContext();

                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Das Einloggen ist fehlgeschlagen. Überprüfe die Mail-Adresse  und das Passwort',
                              ),
                            ),
                          );
                      }
                    }
                  },
                  child: Text(
                    'LOGIN',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('oder'),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: Text(
                    'REGISTRIEREN',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onInputTextChanged() async {
    _searchResult.clear();
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() {});
      return;
    }

    for (final userDetail in _userDetails) {
      if (userDetail.email.contains(emailController.text) &&
          userDetail.password.contains(passwordController.text)) {
        _searchResult.add(userDetail);
      }
    }
    setState(() {});
  }
}

List<User> _searchResult = [];

List<User> _userDetails = [];

const String path = 'assets/mocked_data/user.json';
