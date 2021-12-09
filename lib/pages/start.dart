import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/card_procedure.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Start'),
      body: _myBody(),
      floatingActionButton: _myFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

Widget _myBody() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 200.0), //todo align start
          child: Text(
            'Abonnierte Verfahren',
            style: TextStyle(color: Colors.purple, fontSize: 18),
          ),
        ),
        _proceduresList(),
        const SizedBox(height: 25.0),
        const Padding(
          padding: EdgeInsets.only(right: 200.0), //todo align start
          child: Text(
            'Abonnierte Statistiken',
            style: TextStyle(color: Colors.purple, fontSize: 18),
          ),
        ),
        _proceduresList(), //todo: create statistic card and list
        const SizedBox(height: 20.0),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
            ),
            child: const Text("Log in")),
        const SizedBox(height: 10.0),
      ],
    ),
  );
}

Widget _proceduresList() {
  return SizedBox(
    height: 250.0,
    child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) => CardProcedure(
            "Titel No. $index",
            "Beschreibung $index: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam ",
            "$index",
            true,
            DateTime.now(),
            80.0)),
  );
}

Widget _myFloatingActionButton(BuildContext context) {
  return FloatingActionButton(
    child: const Icon(Icons.add),
    onPressed: () {},
    backgroundColor: Theme.of(context).primaryColor,
  );
}
