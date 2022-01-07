import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/card_procedure.dart';
import 'package:swp_direktdem_verf_app/widgets/card_statistic.dart';
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
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 0),
      body: _myBody(),
      floatingActionButton: _myFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _myBody() {
    return ListView(
      children: const [
        Center(
          child: CardStatistic(
            title: 'Title',
            description: 'description',
            followed: true,
          ),
        ),
        Center(
          child: CardProcedure(
            title: 'Title',
            description: 'Description ',
            followers: 53,
            followed: true,
            year: 2021,
            month: 12,
            day: 21,
            progress: 50.0,
          ),
        ),
      ],
    );
  }

  Widget _myFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: const Icon(Icons.add),
    );
  }
}
