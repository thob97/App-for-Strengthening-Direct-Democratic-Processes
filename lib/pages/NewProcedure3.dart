// ignore_for_file: unnecessary_new

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:intl/intl.dart';
import 'package:swp_direktdem_verf_app/pages/NewProcedure4.dart';
import 'package:swp_direktdem_verf_app/pages/NewProcedure2.dart';


class NewProcedure3 extends StatefulWidget {
  const NewProcedure3({Key? key}) : super(key: key);

  @override
  _NewProcedureState3 createState() => _NewProcedureState3();
}

class _NewProcedureState3 extends State<NewProcedure3> {

  bool isChecked = false;

  final List<String> names = <String>['Aby', 'Aish', 'Ayan', 'Ben', 'Bob', 'Charlie', 'Cook', 'Carline'];
  final List<int> msgCount = <int>[2, 0, 10, 6, 52, 4, 0, 2];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: const CustomAppBar('Neues Verfahren erstellen'),
        body:
        Column(
          children: [
            SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(children: <Widget>[

                  Padding(padding: EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      padding: EdgeInsets.only(right: 10, top: 10),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          border:
                          Border(bottom: BorderSide(color: Colors.grey, width: 2.0))),
                      child: Text("Datei hochladen",
                          textAlign: TextAlign.left, style: TextStyle(fontSize: 30)),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 30),
                    alignment: Alignment.topLeft,
                    child: Text("Hinweise: \nHier können Sie Dokumente zu Ihrem Volksbegehren hochladen. Dies können Sie auch später noch tun.",
                        textAlign: TextAlign.left, style: TextStyle(fontSize: 15)),
                  ),

                  ListTile(
                    title: Text('Amtliche Kosteneinschätzung.pdf'),
                    leading: Icon(Icons.remove_red_eye),
                    trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.remove_red_eye),
                          IconButton(
                            icon: Icon(
                              Icons.delete_outline,
                              size: 20.0,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Call delete Listtile"),
                              ));
                              //   _onDeleteItemPressed(index);
                            },
                          ),
                        ]),
                  ),

                  TextButton.icon(
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(color: Colors.blue),
                      backgroundColor: Colors.white,
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    onPressed: () => {},
                    icon: Icon(Icons.add,),
                    label: Text('DOKUMENT HOCHLADEN',),
                  ),

                ])
            ),


            Padding(
                padding: EdgeInsets.only(top: 400),
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
                        MaterialPageRoute(builder: (context) => const NewProcedure2()),
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
                        MaterialPageRoute(builder: (context) => const NewProcedure4()),
                      );
                    },
                    color: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Text("WEITER", style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white),
                    ),
                  )
                ],
              ),
            ),

          ],
        )

    );
  }
}

