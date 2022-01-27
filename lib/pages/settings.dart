import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/config/route_generator.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/datasecurity.dart';
import 'package:swp_direktdem_verf_app/widgets/animated_bottom_navigation_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
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
      bottomNavigationBar: const AnimatedNavBar(selectedIndex: 3),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
        child: ListView(
          children: [
            SettingsButton(Icons.notes, 'Datenschutzbestimmungen', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DataSecurity()),
              );
            }),
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
              () => Navigator.of(context).pushNamed(
                '/what_happens_next',
                arguments: const NavigationArguments(),
              ),
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
              _showMyDialog();
            }),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Ausloggen',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.apply(color: Theme.of(context).colorScheme.primary),
          ),
          content: Text(
            'Möchten Sie Ihre Sitzung wirklich beenden?',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.apply(color: Theme.of(context).colorScheme.primary),
          ),
          actions: <Widget>[
            _cancleButton(),
            _confirmButton(),
          ],
          elevation: 24.0,
          backgroundColor: Theme.of(context).colorScheme.background,
        );
      },
    );
  }

  Widget _cancleButton() {
    return TextButton(
      onPressed: () => Navigator.pop(context, 'Abbrechen'),
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          Theme.of(context).textTheme.bodyText2?.apply(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
      child: const Text('Abbrechen'),
    );
  }

  Widget _confirmButton() {
    return TextButton(
      onPressed: () => Navigator.of(context).pushNamed(
        '/home',
        arguments: const NavigationArguments(),
      ), //todo push to login view
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          Theme.of(context).textTheme.bodyText2?.apply(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
      child: const Text('Ja'),
    );
  }
}
