import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class NewProcedure extends StatefulWidget {
  const NewProcedure({Key? key}) : super(key: key);

  @override
  _NewProcedureState createState() => _NewProcedureState();
}

class _NewProcedureState extends State<NewProcedure>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: CustomAppBar('Neues Verfahren erstellen'),

      body: new ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, i) {
          return new ExpansionTile(
            title: new Text(vehicles[i].title, style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
            children: <Widget>[
              new Column(
                children: _buildExpandableContent(vehicles[i]),
              ),
            ],
          );
        },
      ),

    );
  }

}

_buildExpandableContent(Vehicle vehicle) {
  List<Widget> columnContent = [];

  for (String content in vehicle.contents)
    columnContent.add(
      new ListTile(
        title: new Text(content, style: new TextStyle(fontSize: 18.0),),
        leading: new Icon(vehicle.icon),
      ),
    );

  return columnContent;
}


class Vehicle {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Vehicle(this.title, this.contents, this.icon);
}

List<Vehicle> vehicles = [
  new Vehicle(
    'Stufe',
    ['1. Stufe', '2. Stufe', '3. Stufe', '4. Stufe'],
    Icons.close,
  ),
];
