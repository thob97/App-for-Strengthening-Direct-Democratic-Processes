import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/config/custom_theme_data.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/change_email.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/change_password.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/login.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/profilepage.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';
import 'package:swp_direktdem_verf_app/service/service_database.dart';
import 'package:swp_direktdem_verf_app/widgets/animated_bottom_navigation_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/settingsbutton.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings(
    this.user,
    this.service, {
    Key? key,
  }) : super(key: key);
  final User user;
  final ServiceDataBase service;
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Profileinstellungen'),
      bottomNavigationBar: const AnimatedNavBar(selectedIndex: 3),
      body: ListView(
        padding: MyConstants.pagePadding,
        children: [
          SettingsButton(
            CommunityMaterialIcons.account_edit,
            'Email ändern',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChangeEmailPage(widget.user, widget.service),
                ),
              );
            },
          ),
          const Divider(),
          SettingsButton(
            CommunityMaterialIcons.account_edit,
            'Passwort ändern',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChangePasswordPage(widget.user, widget.service),
                ),
              );
            },
          ),
          const Divider(),
          SettingsButton(
            CommunityMaterialIcons.account_edit,
            'Zurück zum Profil',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProfilePage(widget.user, widget.service),
                ),
              );
            },
          ),
          const Divider(),
          SettingsButton(CommunityMaterialIcons.account_edit, 'Account löschen',
              () {
            _showMyDialog(context);
          }),
        ],
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Account löschen',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.apply(color: Theme.of(context).colorScheme.primary),
          ),
          content: Text(
            'Möchten Sie Ihren Account wirklich löschen?',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.apply(color: Theme.of(context).colorScheme.primary),
          ),
          actions: <Widget>[
            _cancelButton(context),
            _confirmButton(context, widget.user),
          ],
          elevation: 24.0,
          backgroundColor: Theme.of(context).colorScheme.background,
        );
      },
    );
  }

  Widget _cancelButton(BuildContext context) {
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

  Widget _confirmButton(BuildContext context, User user) {
    return TextButton(
      onPressed: () {
//      Navigator.of(context).pushNamed(
//        '/home',
//        arguments: const NavigationArguments(),
//      );
        onAccountDelete();
        if (isUserDeleted == true) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProfileSettings(widget.user, widget.service),
            ),
          );
        }
      }, //todo push to login view
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

  Future<void> onAccountDelete() async {
    isUserDeleted = await widget.service.deleteUser(widget.user.id);
    if (isUserDeleted == true) {
      widget.service.logout();
    }
  }
}

bool isUserDeleted = false;
