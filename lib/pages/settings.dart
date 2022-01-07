import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/logout.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/settingsbutton.dart';

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
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 3),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
        child: ListView(
          children: [
            SettingsButton(Icons.notes, 'Datenschutzbestimmungen', () {}),
            const Divider(),
            SettingsButton(
              CommunityMaterialIcons.account_edit,
              'Profileinstellungen',
              () {},
            ),
            const Divider(),
            SettingsButton(
              CommunityMaterialIcons.archive_outline,
              'Meine Verfahren',
              () {},
            ),
            const Divider(),
            SettingsButton(
              Icons.admin_panel_settings_outlined,
              'Benutzerverwaltung',
              () {},
            ),
            const Divider(),
            SettingsButton(CommunityMaterialIcons.logout_variant, 'Ausloggen',
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
