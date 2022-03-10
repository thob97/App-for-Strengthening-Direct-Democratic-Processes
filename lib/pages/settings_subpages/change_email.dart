import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/profile_settings.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';
import 'package:swp_direktdem_verf_app/service/service_database.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/textfield_login_register.dart';
import 'package:swp_direktdem_verf_app/widgets/two_butts_in_row.dart';

TextEditingController emailController = TextEditingController();

class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage(
    this.user,
    this.service, {
    Key? key,
  }) : super(key: key);
  final User user;
  final ServiceDataBase service;
  @override
  _ChangeEmailPageState createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
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
                    'Bitte neue eMail eingeben',
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
                            widget.service,
                          ),
                        ),
                      );
                    },
                    functionTwo: () async {
                      if (_formkey.currentState!.validate()) {
                        final form = _formkey.currentState!;
                        if (form.validate()) {
                          updateUserEmail();
                          if (update == true) {
                            TextInput.finishAutofillContext();

                            ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Die eMail erfolgreich geändert'),
                                ),
                              );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileSettings(
                                  _userUpdate.first,
                                  widget.service,
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
                                  widget.service,
                                ),
                              ),
                            );
                          }
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
  Future<void> updateUserEmail() async {
    update = await widget.service
        .updateUser(userId: widget.user.id, email: emailController.text);
    _userUpdate.add(
      User(
        id: widget.user.id,
        firstName: emailController.text.split('@').first,
        lastName: emailController.text.split('@').last.split('.').first,
      ),
    );
  }
}

bool update = false;
List<User> _userUpdate = [];
