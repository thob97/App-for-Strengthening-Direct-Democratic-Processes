// ignore_for_file: unnecessary_new

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:intl/intl.dart';
import 'package:swp_direktdem_verf_app/pages/NewProcedure3.dart';


class NewProcedure4 extends StatefulWidget {
  const NewProcedure4({Key? key}) : super(key: key);

  @override
  _NewProcedureState4 createState() => _NewProcedureState4();
}

class _NewProcedureState4 extends State<NewProcedure4> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: const CustomAppBar('Neues Verfahren erstellen'),
        body:
          SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  padding: EdgeInsets.only(right: 10, top: 10),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      border:
                      Border(bottom: BorderSide(color: Colors.grey, width: 2.0))),
                  child: Text("Vertrauenspersonen",
                      textAlign: TextAlign.left, style: TextStyle(fontSize: 30)),
                ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                  alignment: Alignment.topLeft,
                  child: Text("Hinweis: \nSie können Die E-Mail Adressen der 5 Vertraunspersonen hinzufügen. Diese können dann in dieser App auch das Verfahren bearbeiten.",
                      textAlign: TextAlign.left, style: TextStyle(fontSize: 15)),
                ),

                ListTile(
                  title: Text('max@mustermann.de'),
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text("A", style: TextStyle(color: Colors.white),),
                    maxRadius: 12,
                    foregroundImage: NetworkImage("enterImageUrl"),
                  ),
                  trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

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
                  label: Text('PERSON HINZUFÜGEN',),
                ),


                Padding(
                  padding: EdgeInsets.only(top: 400),
                  child: Container(
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
                              MaterialPageRoute(builder: (context) => const NewProcedure3()),
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
                )


              ])

          ),

    );
  }
}





