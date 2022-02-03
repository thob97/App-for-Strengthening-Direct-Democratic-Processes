import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/animated_bottom_navigation_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar('FAQ'),
      bottomNavigationBar: AnimatedNavBar(selectedIndex: 2),
      body: Center(
        child: Text('Hallo das ist die FAQ'),
      ),
    );
  }
}
