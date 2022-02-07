// ignore_for_file: unnecessary_new

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:intl/intl.dart';
import 'package:swp_direktdem_verf_app/pages/NewProcedure3.dart';
import 'package:swp_direktdem_verf_app/pages/NewProcedure1.dart';


class NewProcedure2 extends StatefulWidget {
  const NewProcedure2({Key? key}) : super(key: key);

  @override
  _NewProcedureState2 createState() => _NewProcedureState2();
}

class _NewProcedureState2 extends State<NewProcedure2> {

  bool isChecked = false;
  bool ischecked1 = false;
  bool ischecked2 = false;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: const CustomAppBar('Neues Verfahren erstellen'),

        bottomNavigationBar:  Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: BottomAppBar(
            color: Colors.transparent,
            elevation: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewProcedure1()),
                    );
                  },
                  child: Text("ZURÜCK",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.black)),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewProcedure3()),
                    );
                  },
                  color: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "WEITER",
                    style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),

        body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child:
            Column(children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  padding: EdgeInsets.only(right: 10, top: 10),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      border:
                      Border(bottom: BorderSide(color: Colors.grey, width: 2.0))),
                  child: Text("Phasenauswahl",
                      textAlign: TextAlign.left, style: TextStyle(fontSize: 30)),
                ),
              ),


              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                alignment: Alignment.topLeft,
                child: Text("Hinweise zum Vorgehen: \n1. Wähle durch Anklicken eines Kastens die "
                    "Phase \naus, in der sich das Verfahren momentan befindet.\nIm Moment der Auswahl werden"
                    " mehr Details zu der\n gewählten Phase angezeigt. "
                    "\n\n2. Setze Häkchen für alle zum "
                    "Phasenabschluss \nnötigen Bedingungen, die für dieses Verfahren schon \nerfüllt wurden. "
                    "Die Endbedingung kann erst \nausgwählt werden, wenn alle anderen Bedingungen\n erfüllt "
                    "wurden. "
                    "\n\n3. Wenn alle Angaben zum Fortschritt des Verfahrens\ngemacht wurden, clicke am Ende der Seite auf Weiter.",
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 15)),
              ),

              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 30),
                  child: Container(
                    height: 280,
                    decoration: BoxDecoration (
                        borderRadius: BorderRadius.all( Radius.circular(25)),
                        color: Colors.white,
                    ),
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                              child: Align( alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                                  child: Container(
                                    width: 50.0,
                                    height: 50.0,
                                    child: new Text("1a"),
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),),
                                ),
                              )
                          ),
                          Column(
                            children: [
                              Container(
                                child:Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 123, right: 10),
                                      child: Container(
                                        color: Colors.blue,
                                        width: 14,
                                        height: 14,
                                        child: Checkbox(
                                          value: isChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              isChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                ),
                              ),
                              Container(
                                child:Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 52, right: 10),
                                      child: Container(
                                        color: Colors.blue,
                                        width: 14,
                                        height: 14,
                                        child: Checkbox(
                                          value: ischecked1,
                                          onChanged: (value) {
                                            setState(() {
                                              ischecked1 = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                ),
                              ),

                              Container(
                                child:Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 32, right: 10),
                                      child: Container(
                                        color: Colors.blue,
                                        width: 14,
                                        height: 14,
                                        child: Checkbox(
                                          value: ischecked2,
                                          onChanged: (value) {
                                            setState(() {
                                              ischecked2 = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),

                          new RichText(
                            text: new TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: new TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                new TextSpan(text: 'Startbedingung: ', style: new TextStyle(fontWeight: FontWeight.bold)),
                                new TextSpan(text: 'Antrag auf amtliche \nKostenschätzung stellen'),
                                new TextSpan(text: '\n\nReferenzdauer: ', style: new TextStyle(fontWeight: FontWeight.bold)),
                                new TextSpan(text: '8 Monate'),
                                new TextSpan(text: '\n\nZu erfüllen vor Phasenabschluss:', style: new TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                                new TextSpan(text: '\n\nAmtliche Kosteneinschätzung ', style: new TextStyle(fontWeight: FontWeight.bold)),
                                new TextSpan(text: '\n  •Zeit: 2 Monate (bis <<Datum>>)'),
                                new TextSpan(text: '\n  •Erfüllt am: <<Datum>>'),
                                new TextSpan(text: '\n\nUnterschriftensammlung ', style: new TextStyle(fontWeight: FontWeight.bold)),
                                new TextSpan(text: '\n  •Zeit: 6 Monate (bis <<Datum>>)'),
                                new TextSpan(text: '\n\nAntrag auf Volksbegehren stellen ', style: new TextStyle(fontWeight: FontWeight.bold)),
                                new TextSpan(text: '\n  •Endbedingung dieser Phase'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ),





              Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration (
                          borderRadius: BorderRadius.all( Radius.circular(25)),
                          color: Colors.white,
                      ),
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                                child: Align( alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      child: new Text("1b"),
                                      alignment: Alignment.center,
                                      decoration: new BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),),
                                  ),
                                )

                            ),


                            new RichText(
                              text: new TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(text: 'Startbedingung: ', style: new TextStyle(fontWeight: FontWeight.bold)),
                                  new TextSpan(text: 'Antrag auf amtliche \nKostenschätzung stellen'),
                                  new TextSpan(text: '\n\nReferenzdauer: ', style: new TextStyle(fontWeight: FontWeight.bold)),
                                  new TextSpan(text: '9-11 Monate und 15 Tage'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )

              ),



              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration (
                        borderRadius: BorderRadius.all( Radius.circular(25)),
                        color: Colors.white,
                    ),
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                              child: Align( alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                                  child: Container(
                                    width: 50.0,
                                    height: 50.0,
                                    child: new Text("2a"),
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),),
                                ),
                              )

                          ),


                          new RichText(
                            text: new TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: new TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                new TextSpan(text: 'Startbedingung: ', style: new TextStyle(fontWeight: FontWeight.bold)),
                                new TextSpan(text: 'Antrag auf amtliche \nKostenschätzung stellen'),
                                new TextSpan(text: '\n\nReferenzdauer: ', style: new TextStyle(fontWeight: FontWeight.bold)),
                                new TextSpan(text: '9-11 Monate und 15 Tage'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ),



              Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration (
                          borderRadius: BorderRadius.all( Radius.circular(25)),
                          color: Colors.white,
                      ),
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                                child: Align( alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      child: new Text("2b"),
                                      alignment: Alignment.center,
                                      decoration: new BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),),
                                  ),
                                )

                            ),


                            new RichText(
                              text: new TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(text: 'Startbedingung: ', style: new TextStyle(fontWeight: FontWeight.bold)),
                                  new TextSpan(text: 'Antrag auf amtliche \nKostenschätzung stellen'),
                                  new TextSpan(text: '\n\nReferenzdauer: ', style: new TextStyle(fontWeight: FontWeight.bold)),
                                  new TextSpan(text: '9-11 Monate und 15 Tage'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
              ),


              Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration (
                          borderRadius: BorderRadius.all( Radius.circular(25)),
                          color: Colors.white,
                      ),
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                                child: Align( alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      child: new Text("3"),
                                      alignment: Alignment.center,
                                      decoration: new BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),),
                                  ),
                                )

                            ),


                            new RichText(
                              text: new TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(text: 'Startbedingung: ', style: new TextStyle(fontWeight: FontWeight.bold)),
                                  new TextSpan(text: 'Antrag auf amtliche \nKostenschätzung stellen'),
                                  new TextSpan(text: '\n\nReferenzdauer: ', style: new TextStyle(fontWeight: FontWeight.bold)),
                                  new TextSpan(text: '9-11 Monate und 15 Tage'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
              ),

            ])
        )
    );
  }
}


_buildExpandableContent2(Data data) {
  List<Widget> columnContent = [];

  for (String content in data.contents) {
    columnContent.add(
      new ListTile(
          title: new Text(
            content,
            style: const TextStyle(fontSize: 18.0),
          ),
          //leading: new Icon(vehicle.icon),
          onTap: () => print("ListTile")),
    );
  }

  return columnContent;
}

_buildExpandableContent(
    Vehicle vehicle,
    ) {
  List<Widget> columnContent = [];

  for (String content in vehicle.contents) {
    columnContent.add(
      new ListTile(
          title: new Text(
            content,
            style: const TextStyle(fontSize: 18.0),
          ),
          leading: new Icon(vehicle.icon),
          onTap: () => print("ListTile")),
    );
  }

  return columnContent;
}


class Vehicle {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Vehicle(this.title, this.contents, this.icon);
}

List<Vehicle> vehicles = [
  Vehicle(
    'Tehmenbereiche',
    [
      '1. Tehmenbereich',
      '2. Tehmenbereich',
      '3. Tehmenbereich',
      '4. Tehmenbereich',
      '3. Tehmenbereich',
      '4. Tehmenbereich',
      '3. Tehmenbereich',
      '4. Tehmenbereich'
    ],
    Icons.close,
  ),
];

class Data {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Data(this.title, this.contents, this.icon);
}

List<Data> datas = [
  Data(
    'Datein',
    [
      '1. Datei',
      '2. Datei',
      '3. Datei',
      '4. Datei',
      '3. Datei',
      '4. Datei',
      '3. Datei',
      '4. Datei'
    ],
    Icons.close,
  ),
];


