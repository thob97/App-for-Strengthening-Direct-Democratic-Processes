import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_bottom_navigation_bar.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Start'),
      bottomNavigationBar: CustomBottomNavigationBar(selectedIndex: 0),
      body: _myBody(),
      floatingActionButton: _myFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _myBody() {
    return const Center(
      child: Text("Hallo das ist die Seite Start"),
    );
  }

  Widget _myFloatingActionButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {},
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
