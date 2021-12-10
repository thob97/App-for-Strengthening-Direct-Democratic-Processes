// ignore_for_file: unnecessary_new

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class NewProcedure extends StatefulWidget {
  const NewProcedure({Key? key}) : super(key: key);

  @override
  _NewProcedureState createState() => _NewProcedureState();
}

class _NewProcedureState extends State<NewProcedure> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: const CustomAppBar('Neues Verfahren erstellen'),
      body: Column(
          children: <Widget>[

            Expanded(
              child: ListView.builder(
              itemCount: vehicles.length,
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 30),
              itemBuilder: (context, i) {
                return new ExpansionTile(
                  title: new Text(
                    vehicles[i].title,
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  children: <Widget>[
                    new Column(
                      children: _buildExpandableContent(vehicles[i]),
                    ),
                  ],
                );
              },
            )),

            Align(alignment: Alignment.centerLeft,
              child: new Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child:             TextButton.icon(
                  icon: Icon( Icons.close,
                    size: 34,
                    color: Colors.white,
                  ), // Your icon here
                  label: Text("1 To Do"), // Your text here
                  onPressed: (){
                    //DO SOMETHING
                    onTap: ()=>debugPrint("I was clicked");
                  },
                ),
              ),
            ),

            Align(alignment: Alignment.centerLeft,
              child: new Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child:             TextButton.icon(
                  icon: Icon( Icons.close,
                    size: 34,
                    color: Colors.white,
                  ), // Your icon here
                  label: Text("2 Upload"), // Your text here
                  onPressed: (){
                    //DO SOMETHING
                    onTap: ()=>debugPrint("I was clicked");
                  },
                ),
              ),
            ),

          new Padding(padding: const EdgeInsets.only(left: 20, right: 20),
            child : Divider(thickness: 3, color: Colors.purple )
          ),

            Expanded( child: ListView.builder(
            itemCount: datas.length,
            padding: EdgeInsets.only(left: 10, right: 10),
            itemBuilder: (context, i) {
              return new ExpansionTile(
                title: new Text(
                  datas[i].title,
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                children: <Widget>[
                  new Column(
                    children: _buildExpandableContent2(datas[i]),
                  ),
                ],
              );
            },
          ),),

          ]
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
          onTap: () => print("ListTile")
      ),
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
          onTap: () => print("ListTile")
      ),
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
    'Stufe',
    ['1. Stufe', '2. Stufe', '3. Stufe', '4. Stufe', '3. Stufe', '4. Stufe', '3. Stufe', '4. Stufe'],
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
    'Dateien',
    ['1. Datei', '2. Datei', '3. Datei', '4. Datei', '3. Datei', '4. Datei', '3. Datei', '4. Datei'],
    Icons.close,
  ),
];
