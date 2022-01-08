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

    return Container(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: const CustomAppBar('Profil'),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => EditProfilePage(user)),
                  );
                },
              ),
              const SizedBox(height: 24),
              buildName(user),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name.split(' ').first,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.name.split(' ').last,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );
}
