import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar('Ausloggen'),
      body: Center(
        child: Text('Hallo das ist die Ausloggen Seite'),
      ),
    );
  }
}
