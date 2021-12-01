import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/settingsbuttom.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
        child: ListView(
          children: [
            SettingsButton(Icons.notes, "Datenschutzbestimmungen", () {}),
            const Divider(
              color: Colors.purple,
            ),
            SettingsButton(CommunityMaterialIcons.account_edit,
                "Profileinstellungen", () {}),
            const Divider(
              color: Colors.purple,
            ),
            SettingsButton(Icons.create, "Neues Erfahren erstellen", () {}),
            const Divider(
              color: Colors.purple,
            ),
            SettingsButton(Icons.question_answer, "FAQ", () {}),
            const Divider(
              color: Colors.purple,
            ),
            SettingsButton(
                CommunityMaterialIcons.logout_variant, "Ausloggen", () {}),
          ],
        ),
      ),
    );
  }
}
