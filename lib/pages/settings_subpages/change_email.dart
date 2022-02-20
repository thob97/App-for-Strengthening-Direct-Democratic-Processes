import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/profile_settings.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/textfield_login_register.dart';
import 'package:swp_direktdem_verf_app/widgets/two_butts_in_row.dart';

class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage(
    this.user,
    this.users, {
    Key? key,
  }) : super(key: key);
  final User user;
  final List<User> users;
  @override
  _ChangeEmailPageState createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CustomAppBar('eMail ändern'),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  TextfieldLoginRegister(
                    'Email',
                    widget.user.email,
                    emailController,
                  ),
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

                        if (form.validate()) {
                          onInputTextChanged();
                          TextInput.finishAutofillContext();

                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(
                              const SnackBar(
                                content: Text('Die eMail erfolgreich geändert'),
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
                                  'Die eMailÄnderung ist fehlgeschlagen',
                                ),
                              ),
                            );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangeEmailPage(
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
      if (emailController.text != userDetail.email &&
          widget.user.id == userDetail.id) {
        widget.users.removeWhere((_user) => _user.id == userDetail.id);
        widget.users.add(
          User(
            last_login: userDetail.last_login,
            is_active: userDetail.is_active,
            is_superuser: userDetail.is_superuser,
            first_name: userDetail.first_name,
            password: userDetail.password,
            id: userDetail.id,
            date_joined: userDetail.date_joined,
            email: emailController.text,
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
