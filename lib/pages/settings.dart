import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/config/custom_theme_data.dart';
import 'package:swp_direktdem_verf_app/config/route_generator.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/datasecurity.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/login.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/profilepage.dart';
import 'package:swp_direktdem_verf_app/pages/utils/user_preferences.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';
import 'package:swp_direktdem_verf_app/widgets/animated_bottom_navigation_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/settingsbutton.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key, required this.user, required this.pressGeoON}) : super(key: key);
  final User user;
  final bool pressGeoON;
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  //late User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Einstellungen'),
      bottomNavigationBar: const AnimatedNavBar(selectedIndex: 3),
      body: ListView(
        padding: MyConstants.pagePadding,
        children: [
          SettingsButton(
            CommunityMaterialIcons.account_edit,
          (widget.pressGeoON==true) ? 'Benutzer' :'Anmelden',
          (widget.pressGeoON==true)
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          widget.user,
                        ),
                      ),
                    );
                  }
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
          ),
          const Divider(),
          SettingsButton(
            CommunityMaterialIcons.archive_outline,
            'Meine Verfahren',
            () => Navigator.of(context).pushNamed(
              '/my_procedures',
              arguments: const NavigationArguments(),
            ),
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
