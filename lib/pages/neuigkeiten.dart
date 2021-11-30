import 'package:flutter/material.dart';

class Neuigkeiten extends StatefulWidget {
  const Neuigkeiten({Key? key}) : super(key: key);

  @override
  _NeuigkeitenState createState() => _NeuigkeitenState();
}

class _NeuigkeitenState extends State<Neuigkeiten> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Neuigkeiten')),
      body: Center(
        child: Text("Hallo das ist die Seite Neuigkeiten"),
      ),
    );
  }
}
