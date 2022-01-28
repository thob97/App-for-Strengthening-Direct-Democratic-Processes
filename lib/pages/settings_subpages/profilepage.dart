import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/profilesettings.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/usermodel.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/profilewidget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage(this.user, {Key? key}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    // const user = UserPreferences.myUser;

    return Builder(
      builder: (context) => Scaffold(
        appBar: const CustomAppBar('Profil'),
        body: Container(
          padding: const EdgeInsets.only(top: 16.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditProfilePage(user),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              buildName(user, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(User user, BuildContext context) => Column(
        children: [
          Text(
            user.name.split(' ').first,
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 4),
          Text(
            user.name.split(' ').last,
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: Theme.of(context).textTheme.bodyText2,
          )
        ],
      );
}
