import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:swp_direktdem_verf_app/pages/settings.dart';
import 'package:swp_direktdem_verf_app/pages/start.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Ausloggen'),
      body: myBody(context),
    );
  }
}

Widget myBody(BuildContext context) {
  return Column(
    children: [
      const Center(
        heightFactor: 10,
        child: Text("Wollen Sie Ihre Sitzung beenden?",
            style: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.all(10),
              child: FloatingActionButton.extended(
                  heroTag: "btn1",
                  label: const Text('Sitzung beenden',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  icon: const Icon(Icons.arrow_forward_outlined,
                      color: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Start()),
                    );
                  },
                  backgroundColor:
                      Theme.of(context).primaryColor)), //button first
          Container(
              margin: const EdgeInsets.all(10),
              child: FloatingActionButton.extended(
                  heroTag: "btn2",
                  label: const Text('Abbrechen',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  icon: const Icon(Icons.arrow_forward_outlined,
                      color: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  },
                  backgroundColor:
                      Theme.of(context).primaryColor)), // button second
        ],
      ),
    ],
  );
}
