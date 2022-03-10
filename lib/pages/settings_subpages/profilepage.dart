// ignore: eol_at_end_of_file
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/settings.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/profile_settings.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';
import 'package:swp_direktdem_verf_app/service/service_database.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/two_butts_in_row.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage(
    this.user,
    this.service, {
    Key? key,
  }) : super(key: key);
  final User user;
  final ServiceDataBase service;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // const user = UserPreferences.myUser;
    return Builder(
      builder: (context) => Scaffold(
        appBar: const CustomAppBar('Profil'),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 16.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 24),
                buildName(widget.user, context),
                const SizedBox(height: 35),
                TwoButtInRow(
                  functionOne: () => _showMyDialog(context),
                  functionTwo: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfileSettings(
                          widget.user,
                          widget.service,
                        ),
                      ),
                    );
                  },
                  buttonNameTwo: 'Profil bearbeiten',
                  buttonNameOne: 'Ausloggen',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildName(User user, BuildContext context) {
    return Column(
      children: [
        Text(
          widget.user.firstName,
          style: Theme.of(context).textTheme.headline2,
        ),
        const SizedBox(height: 4),
        Text(
          widget.user.lastName,
          style: Theme.of(context).textTheme.headline2,
        ),
        const SizedBox(height: 4),
        Text(
          '${user.firstName}@${user.lastName}.com',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Ausloggen',
            style: Theme.of(context).textTheme.bodyText1?.apply(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          content: Text(
            'Möchten Sie Ihre Sitzung wirklich beenden?',
            style: Theme.of(context).textTheme.bodyText2?.apply(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          actions: <Widget>[
            _cancelButton(context),
            _confirmButton(context),
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

  Widget _confirmButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        logoutUser();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Settings(
              user: const User(id: '', firstName: '', lastName: ''),
              service: widget.service,
            ),
          ),
        );
      },
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

  Future<void> logoutUser() async {
    widget.service.logout();
  }
}
