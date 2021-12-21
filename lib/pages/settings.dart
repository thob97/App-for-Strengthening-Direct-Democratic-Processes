import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/datasecurity.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/profilesettings.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/usermanagement.dart';
import 'package:swp_direktdem_verf_app/utils/user_preferences.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/settingsbuttom.dart';

import 'settings_subpages/logout.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Settings'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
        child: ListView(
          children: [
            SettingsButton(Icons.notes, "Datenschutzbestimmungen", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DataSecurity()),
              );
            }),
            Divider(
              color: Theme.of(context).primaryColor,
            ),
            SettingsButton(
                CommunityMaterialIcons.account_edit, "Profileinstellungen", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const EditProfilePage(UserPreferences.myUser)),
              );
            }),
            Divider(
              color: Theme.of(context).primaryColor,
            ),
            SettingsButton(CommunityMaterialIcons.archive_outline,
                "Meine Verfahren", () {}),
            Divider(
              color: Theme.of(context).primaryColor,
            ),
            SettingsButton(
                Icons.admin_panel_settings_outlined, "Benutzerverwaltung", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserScreen()),
              );
            }),
            Divider(
              color: Theme.of(context).primaryColor,
            ),
            SettingsButton(CommunityMaterialIcons.logout_variant, "Ausloggen",
                () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Logout()),
              );
            }),
          ],
        ),
      ),
    );
  }
}
