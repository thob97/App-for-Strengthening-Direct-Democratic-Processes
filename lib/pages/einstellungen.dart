import 'package:flutter/material.dart';

class Einstellungen extends StatefulWidget {
  const Einstellungen({Key? key}) : super(key: key);

  @override
  _EinstellungenState createState() => _EinstellungenState();
}

class _EinstellungenState extends State<Einstellungen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Einstellungen')),
      body: Center(
        child: Text("Hallo das ist die Seite Einstellungen"),
      ),
    );
  }
}
