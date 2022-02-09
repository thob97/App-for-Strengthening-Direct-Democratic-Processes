import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/config/custom_theme_data.dart';
import 'package:swp_direktdem_verf_app/config/route_generator.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/datasecurity.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/profilepage.dart';
import 'package:swp_direktdem_verf_app/utils/user_preferences.dart';
import 'package:swp_direktdem_verf_app/widgets/animated_bottom_navigation_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/settingsbutton.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Einstellungen'),
      bottomNavigationBar: const AnimatedNavBar(selectedIndex: 3),
      body: ListView(
        padding: MyConstants.pagePadding,
        children: [
          SettingsButton(
            CommunityMaterialIcons.archive_outline,
            'Meine Verfahren',
            () => Navigator.of(context).pushNamed(
              '/my_procedures',
              arguments: const NavigationArguments(),
            ),
          ),
          const Divider(),
          SettingsButton(
            CommunityMaterialIcons.account_edit,
            'Profileinstellungen',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ProfilePage(UserPreferences.myUser),
                ),
              );
            },
          ),
          const Divider(),
          SettingsButton(Icons.notes, 'Datenschutzbestimmungen', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DataSecurity()),
            );
          }),
        ],
      ),
    );
  }
}
