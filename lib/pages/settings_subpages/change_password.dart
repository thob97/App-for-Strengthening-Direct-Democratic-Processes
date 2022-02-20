import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/profile_settings.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/password_confirm.dart';
import 'package:swp_direktdem_verf_app/widgets/textfield_login_register.dart';
import 'package:swp_direktdem_verf_app/widgets/two_butts_in_row.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage(
    this.user,
    this.users, {
    Key? key,
  }) : super(key: key);
  final User user;
  final List<User> users;
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController passController = TextEditingController();
  TextEditingController passConfController = TextEditingController();
  TextEditingController controllerPassOld = TextEditingController();
  bool isHidden1 = false;
  bool isHidden2 = false;
  void togglePasswordVisibility1() => setState(() => isHidden1 = !isHidden1);
  void togglePasswordVisibility2() => setState(() => isHidden2 = !isHidden2);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CustomAppBar('Passwort ändern'),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  TextfieldLoginRegister(
                    'Altes Passwort',
                    'Altes Passwort',
                    controllerPassOld,
                  ),
                  const SizedBox(height: 10),
                  PasswordFieldWidget(
                    passController: passController,
                    confPassController: passConfController,
                  ),

                  // To validate call
                  const SizedBox(height: 10),

                  TwoButtInRow(
                    buttonNameOne: 'Abbrechen',
                    buttonNameTwo: 'Speichern',
                    functionOne: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileSettings(
                            widget.user,
                            widget.users,
                          ),
                        ),
                      );
                    },
                    functionTwo: () async {
                      if (_formkey.currentState!.validate()) {
                        final form = _formkey.currentState!;

                        if (form.validate() &&
                            controllerPassOld.text == widget.user.password) {
                          onInputTextChanged();
                          TextInput.finishAutofillContext();

                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Das Passwort erfolgreich geändert'),
                              ),
                            );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileSettings(
                                _searchResult.first,
                                widget.users,
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
                                  'Die Passwortänderung ist fehlgeschlagen. Das alte Passwort ist nicht korrekt und oder das neue Passwort entspricht nicht den Sicherheitsanforderungen.',
                                ),
                              ),
                            );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangePasswordPage(
                                widget.user,
                                widget.users,
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  Future<void> onInputTextChanged() async {
    _searchResult.clear();
    for (final userDetail in widget.users) {
      if (passController.text != userDetail.password &&
          widget.user.id == userDetail.id) {
        widget.users.removeWhere((_user) => _user.id == userDetail.id);
        widget.users.add(
          User(
            last_login: userDetail.last_login,
            is_active: userDetail.is_active,
            is_superuser: userDetail.is_superuser,
            first_name: userDetail.first_name,
            password: passController.text,
            id: userDetail.id,
            date_joined: userDetail.date_joined,
            email: userDetail.email,
            last_name: userDetail.last_name,
            is_staff: userDetail.is_staff,
          ),
        );
      }
    }
    for (final userDetail in widget.users) {
      if (widget.user.id == userDetail.id) {
        _searchResult.add(userDetail);
      }
    }
  }
}

List<User> _searchResult = [];
