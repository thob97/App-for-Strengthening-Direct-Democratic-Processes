// ignore_for_file: unnecessary_new

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:intl/intl.dart';
import 'package:swp_direktdem_verf_app/pages/NewProcedure3.dart';

List<Person> personList = [];
TextEditingController textEditingControllerPersonname = TextEditingController();


class NewProcedure4 extends StatefulWidget {
  const NewProcedure4({Key? key}) : super(key: key);


  @override
  _NewProcedureState4 createState() => _NewProcedureState4();
}

class _NewProcedureState4 extends State<NewProcedure4> {

  void delete(int id) {
    personList.removeAt(id);
  }

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
                        builder: (context) => const NewProcedure3()),
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
                        builder: (context) => const NewProcedure4()),
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

        Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Container(
          padding: EdgeInsets.only(right: 10, top: 10),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
              border:
              Border(bottom: BorderSide(color: Colors.grey, width: 2.0))),
          child: Text("Redakteure",
              textAlign: TextAlign.left, style: TextStyle(fontSize: 30)),
        ),
      ),

      Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 30),
        alignment: Alignment.topLeft,
        child: Text(
            "Hinweis: \nSie können die E-Mail Adressen der 5 Redakteure \nhinzufügen. Diese können dann in dieser\nApp auch das Verfahren bearbeiten.",
            textAlign: TextAlign.left, style: TextStyle(fontSize: 15), softWrap: true),

      ),


      Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: personList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: ListTile(
                title: Text(personList.elementAt(index).personName),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(personList.elementAt(index).firstLetter, style: TextStyle(color: Colors.white),),
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
                          delete(index);
                          setState(() {});
                          //   _onDeleteItemPressed(index);
                        },
                      ),
                    ]),
              ),
            );
          },
        ),
      ),


      TextButton.icon(
          style: TextButton.styleFrom(
            textStyle: TextStyle(color: Colors.blue),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
          onPressed: () => {

          showDialog(
          context: context,
          builder: (_) =>
          AlertDialog(
          actions: [
          FlatButton(
          child: Text("Cancel"),
          onPressed: () {
            textEditingControllerPersonname.clear();
            Navigator.of(context).pop();
          },
          ),
          FlatButton(
          child: Text("Continue"),
      onPressed: () {
            personList.add(Person(textEditingControllerPersonname.value.text, textEditingControllerPersonname.value.text.substring(0,1)));
            textEditingControllerPersonname.clear();
            Navigator.of(context).pop();
            setState(() {});
      },
    ),
          ],

    title: Text('TextField in Dialog'),
    content: TextField(
    onChanged: (value) { },
    controller: textEditingControllerPersonname,
    decoration: InputDecoration(hintText: "Text Field in Dialog"),

    ),
    ),
    ),

    },
    icon: Icon(Icons.add,),
    label: Text('PERSON HINZUFÜGEN',),
    ),

    ])

    )
    ,

    );
  }
}


class Person {
  String personName;
  String firstLetter;

  Person(this.personName, this.firstLetter);
}

