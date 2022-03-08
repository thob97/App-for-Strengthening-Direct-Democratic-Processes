import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';
import 'package:swp_direktdem_verf_app/service/service_database.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class ProfilePageForAdmin extends StatefulWidget {
  const ProfilePageForAdmin(
    this.user,
    this.service, {
    Key? key,
  }) : super(key: key);
  final User user;
  final ServiceDataBase service;
  @override
  _ProfilePageForAdminState createState() => _ProfilePageForAdminState();
}

class _ProfilePageForAdminState extends State<ProfilePageForAdmin> {
  @override
  Widget build(BuildContext context) {
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
}
