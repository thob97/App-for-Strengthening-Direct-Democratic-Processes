import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swp_direktdem_verf_app/pages/settings.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/register.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';
import 'package:swp_direktdem_verf_app/service/service_database.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/textfield_login_register.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _loggedUser.clear();
    super.initState();
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
              children: [
                const SizedBox(
                  height: 15,
                ),
                TextfieldLoginRegister(
                  'Email',
                  'user@domain.com',
                  emailController,
                ),
                TextfieldLoginRegister(
                  'Passwort',
                  '******',
                  passwordController,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      final form = _formkey.currentState!;
                      onInputTextChanged();
                      if (form.validate() && _loggedUser.isNotEmpty) {
                        {
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
                                user: _loggedUser.first,
                                service: service,
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
                        setState(() {});
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
    final bool _userExist = await service.login(
      email: emailController.text,
      password: passwordController.text,
    );
    service.init();
    if (_userExist != false) {
      final String id = (await service.getOwnUser())!;
      _loggedUser.add(
        User(
          firstName: emailController.text.split('@').first,
          id: id,
          lastName: emailController.text.split('@').last.split('.').first,
        ),
      );
    }
    setState(() {
      emailController.clear();
      passwordController.clear();
    });
  }
}

List<User> _loggedUser = [];
final ServiceDataBase service = ServiceDataBase();
