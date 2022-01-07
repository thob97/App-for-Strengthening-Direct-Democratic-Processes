import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/usermodel.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/profilewidget.dart';

class EditProfilePage extends StatelessWidget {
  final User user;
  const EditProfilePage(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool switchValue = false;
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
            buildTextField("Vorname", user.name.split(" ").first),
            buildTextField("Nachname", user.name.split(" ").last),
            buildTextField("Email", user.email),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            child: Container(
                              height: 400.0,
                              width: 360.0,
                              child: ListView(
                                children: <Widget>[
                                  const Center(
                                    child: Text(
                                      "Passwort ändern",
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  buildTextField(
                                      "Altes Passwort", "Altes Passwort"),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Neues Passwort",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  buildTextField("Passwort", "Passwort"),
                                  buildTextField("Passwort wiederholen",
                                      "Passwort wiederholen"),
                                  RaisedButton(
                                    onPressed: () {},
                                    color: Theme.of(context).primaryColor,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Text(
                                      "Speichern",
                                      style: TextStyle(
                                          fontSize: 14, letterSpacing: 2.2),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  color: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    "PASSWORT ÄNDERN",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                    ),
                  ),
                )
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              const Text(
                "Email Adresse sichtbar machen",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    value: switchValue,
                    onChanged: (value) {},
                  ))
            ]),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlineButton(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                  child: const Text("ABBRECHEN",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                      )),
                ),
                RaisedButton(
                  onPressed: () {},
                  color: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    "SPEICHERN",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Column(children: [
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
              autofocus: false,
              onTap: () {},
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                  ),
                  contentPadding: const EdgeInsets.only(bottom: 3),
                  labelText: "  " + labelText,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "  " + placeholder,
                  labelStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  hintStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ),
      )
    ]);
  }
}
