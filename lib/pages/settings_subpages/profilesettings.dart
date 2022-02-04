import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/change_password.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/usermodel.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/profilewidget.dart';
import 'package:swp_direktdem_verf_app/widgets/textfield_login_register.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage(this.user, {Key? key}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    const bool switchValue = false;
    return Scaffold(
      appBar: const CustomAppBar('Profileinstellungen'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16.0),
        child: Center(
          child: Column(
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                isEdit: true,
                onClicked: () async {},
              ),
              const SizedBox(
                height: 35,
              ),
              TextfieldLoginRegister('Vorname', user.name.split(' ').first),
              TextfieldLoginRegister('Nachname', user.name.split(' ').last),
              TextfieldLoginRegister('Email', user.email),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePasswordPage(user),),
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
                  Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: switchValue,
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
