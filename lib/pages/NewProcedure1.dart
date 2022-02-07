// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/pages/NewProcedure3.dart';
import 'package:swp_direktdem_verf_app/pages/home.dart';
import 'package:intl/intl.dart';

TextEditingController textEditingControllerBeschreibung = TextEditingController();
TextEditingController textEditingControllerTitelDesVolksbegehrens = TextEditingController();
TextEditingController textEditingControllerTitelStartdatum = TextEditingController();
TextEditingController textEditingControllerKontakt = TextEditingController();
TextEditingController textEditingControllerWebsite = TextEditingController();



class NewProcedure1 extends StatefulWidget {
  const NewProcedure1({Key? key}) : super(key: key);

  @override
  _NewProcedureState1 createState() => _NewProcedureState1();
}

class _NewProcedureState1 extends State<NewProcedure1> {
  DateTime selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
          textEditingControllerTitelStartdatum.text = formatter.format(picked);
        });
    }

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
                          builder: (context) => const Home()),
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

        body:
        SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(children: <Widget>[

              new Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  padding: EdgeInsets.only(right: 10, top: 10),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      border:
                      Border(bottom: BorderSide(color: Colors.grey, width: 2.0))),

                  child: Text("Titel",
                      textAlign: TextAlign.left, style: TextStyle(fontSize: 30)),
                ),
              ),

              new Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                child: TextField(
                  controller: textEditingControllerTitelDesVolksbegehrens,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Titel des Volksbegehrens',
                    //fillColor: Colors.white,
                    //filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Container(
                  padding: EdgeInsets.only(right: 10, top: 20),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      border:
                      Border(bottom: BorderSide(color: Colors.grey, width: 2.0))),
                  child: Text("Beschreibung",
                      textAlign: TextAlign.left, style: TextStyle(fontSize: 30)),
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                alignment: Alignment.topLeft,
                child: Text(
                    "Was sollten Sie hier schreiben\n• Was ist das Ziel?\n• Motivation? ",
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),
              ),


              new Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: TextField(
                  maxLines: 7,
                  controller: textEditingControllerBeschreibung,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Beschreibung',
                    //fillColor: Colors.white,
                    //filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),


              new Padding(
                padding: EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 15),
                child: TextField(
                  controller: textEditingControllerTitelStartdatum,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Startdatum',
                    //fillColor: Colors.white,
                    //filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today_outlined),
                        onPressed: () {
                          _selectDate(context);
                        }),
                  ),
                ),
              ),


              new Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Divider(thickness: 3, color: Colors.purple)),

              Padding(padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Container(
                  padding: EdgeInsets.only(right: 10, top: 20),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      border:
                      Border(bottom: BorderSide(color: Colors.grey, width: 2.0))),
                  child: Text("Kontakt",
                      textAlign: TextAlign.left, style: TextStyle(fontSize: 30)),
                ),
              ),

              new Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: TextField(
                  controller: textEditingControllerKontakt,
                  maxLines: 7,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Kontakt',
                    //fillColor: Colors.white,
                    //filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),

              new Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: Container(
                    padding: EdgeInsets.only(right: 10, top: 20),
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                    border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 2.0))),
                    child: Text("Website",
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 30)),
                    ),
              ),



              new Padding(
                padding: EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 15),
                child: TextField(
                  controller: textEditingControllerWebsite,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Website des Volksbegehrens',
                      //fillColor: Colors.white,
                      //filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                  ),
                ),
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

_buildExpandableContent(Vehicle vehicle,) {
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


