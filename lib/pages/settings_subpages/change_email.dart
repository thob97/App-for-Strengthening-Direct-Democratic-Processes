import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/profile_settings.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/textfield_login_register.dart';
import 'package:swp_direktdem_verf_app/widgets/two_butts_in_row.dart';

class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage(this.user, {Key? key}) : super(key: key);
  final User user;
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
                            user: widget.user,
                          ),
                        ),
                      );
                    },
                    functionTwo: () async {
                      if (_formkey.currentState!.validate()) {
                        final form = _formkey.currentState!;

                        if (form.validate()) {
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
                              builder: (context) =>
                                  ProfileSettings(user: widget.user),
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
}
