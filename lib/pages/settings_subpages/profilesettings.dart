import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/usermodel.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/profilewidget.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage(this.user, {Key? key}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    const bool switchValue = false;
    return Scaffold(
      appBar: const CustomAppBar('Profileinstellungen'),
      body: Container(
        padding: const EdgeInsets.only(top: 16.0),
        child: ListView(
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(
              height: 35,
            ),
            buildTextField('Vorname', user.name.split(' ').first, context),
            buildTextField('Nachname', user.name.split(' ').last, context),
            buildTextField('Email', user.email, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          elevation: 16,
                          child: SizedBox(
                            height: 400.0,
                            width: 360.0,
                            child: ListView(
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'Passwort ändern',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                buildTextField(
                                  'Altes Passwort',
                                  'Altes Passwort',
                                  context,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Neues Passwort',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                buildTextField('Passwort', 'Passwort', context),
                                buildTextField(
                                  'Passwort wiederholen',
                                  'Passwort wiederholen',
                                  context,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        Theme.of(context).colorScheme.primary,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 50,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    'Speichern',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'PASSWORT ÄNDERN',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                )
              ],
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
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'ABBRECHEN',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'SPEICHERN',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
    String labelText,
    String placeholder,
    BuildContext context,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 35.0,
          ),
          child: SizedBox(
            height: 60,
            width: 350,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onTap: () {},
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                  ),
                  labelText: '  $labelText',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: '  $placeholder',
                  labelStyle: Theme.of(context).textTheme.headline2,
                  hintStyle: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
