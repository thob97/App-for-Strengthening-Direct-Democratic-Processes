import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/cardProcedure.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Abonnierte Verfahren',
              textAlign: TextAlign
                  .start, //todo: for some reason the text is in the center ???
              style: TextStyle(color: Colors.purple, fontSize: 18),
            ),
            _procedureList(),
            const SizedBox(height: 25.0),
            const Text(
              'Abonnierte Statistiken',
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.purple, fontSize: 18),
            ),
            _procedureList(), //todo: create statistic card and list
            const SizedBox(height: 25.0),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
                child: const Text("Log in"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

Widget _procedureList() {
  return SizedBox(
    height: 200.0,
    child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) => CardProcedure(
            "Titel No. $index",
            "Beschreibung $index: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam ",
            "$index",
            true,
            DateTime.now())),
  );
}
