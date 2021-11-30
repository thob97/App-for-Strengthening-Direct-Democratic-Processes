import 'package:flutter/material.dart';

class Entdecken extends StatefulWidget {
  const Entdecken({Key? key}) : super(key: key);

  @override
  _EntdeckenState createState() => _EntdeckenState();
}

class _EntdeckenState extends State<Entdecken> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Entdecken')),
      body: Center(
        child: Text("Hallo das ist die Seite Entdecken"),
      ),
    );
  }
}
