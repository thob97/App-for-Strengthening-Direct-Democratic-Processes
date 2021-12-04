import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar('Discover'),
      body: Center(
        child: Text("Hallo das ist die Seite Discover"),
      ),
    );
  }
}
