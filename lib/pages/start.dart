import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/animated_bottom_navigation_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/card_procedure.dart';
import 'package:swp_direktdem_verf_app/widgets/card_statistic.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

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
      bottomNavigationBar: const AnimatedNavBar(selectedIndex: 0),
      body: _myBody(),
      floatingActionButton: _myFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _myBody() {
    return ListView(
      children: <Widget>[
        _smallSizedBox(),
        _subProceduresText(),
        _subProcedures(),
        _bigSizedBox(),
        _subStatisticsText(),
        _subStatistics(),
        _bigSizedBox(),
        _myLoginButton(),
        _smallSizedBox(),
      ],
    );
  }

  Widget _myFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Icon(Icons.add, color: Theme.of(context).colorScheme.background),
    );
  }

  Widget _subProceduresText() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(
        'Abonnierte Verfahren',
        style: Theme.of(context)
            .textTheme
            .headline2
            ?.apply(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }

  Widget _subStatisticsText() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(
        'Abonnierte Statistiken',
        style: Theme.of(context)
            .textTheme
            .headline2
            ?.apply(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }

  Widget _subProcedures() {
    return SizedBox(
      height: 250.0,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) => CardProcedure(
          //dummy procedures data
          title: 'Titel No. $index',
          description:
              'Beschreibung $index: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam ',
          followers: index,
          followed: true,
          year: DateTime.now().year,
          month: DateTime.now().month,
          day: DateTime.now().day,
          progress: 80.0,
        ),
      ),
    );
  }

  Widget _subStatistics() {
    return SizedBox(
      height: 250.0,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) => CardStatistic(
          //dummy statistics data
          title: 'Titel No. $index',
          description:
              'Beschreibung $index: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam ',
          followed: true,
        ),
      ),
    );
  }

//TODO: if loged in => shrink()
  Widget _myLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 160.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          'Log in',
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.apply(color: Theme.of(context).colorScheme.background),
        ),
      ),
    );
  }

  Widget _smallSizedBox() {
    return const SizedBox(height: 10.0);
  }

  Widget _bigSizedBox() {
    return const SizedBox(height: 20.0);
  }
}
