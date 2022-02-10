import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/new_procedure3.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

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
    return Scaffold(
      appBar: const CustomAppBar('Neues Verfahren erstellen'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'ZURÜCK',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2.2,
                    color: Colors.black,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewProcedure3(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'WEITER',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2.2,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                padding: const EdgeInsets.only(right: 10, top: 10),
                alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 2.0)),
                ),
                child: const Text(
                  'Redakteure',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 20, bottom: 30),
              alignment: Alignment.topLeft,
              child: const Text(
                'Hinweis: \nSie können die E-Mail Adressen der 5 Redakteure \nhinzufügen. Diese können dann in dieser\nApp auch das Verfahren bearbeiten.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15),
                softWrap: true,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: personList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(personList.elementAt(index).personName),
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    maxRadius: 12,
                    foregroundImage: const NetworkImage('enterImageUrl'),
                    child: Text(
                      personList.elementAt(index).firstLetter,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(
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
                    ],
                  ),
                );
              },
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(color: Colors.blue),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              onPressed: () => {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    actions: [
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          textEditingControllerPersonname.clear();
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Continue'),
                        onPressed: () {
                          personList.add(Person(
                              textEditingControllerPersonname.value.text,
                              textEditingControllerPersonname.value.text
                                  .substring(0, 1)));
                          textEditingControllerPersonname.clear();
                          Navigator.of(context).pop();
                          setState(() {});
                        },
                      ),
                    ],
                    title: const Text('TextField in Dialog'),
                    content: TextField(
                      onChanged: (value) {},
                      controller: textEditingControllerPersonname,
                      decoration: const InputDecoration(
                          hintText: 'Text Field in Dialog'),
                    ),
                  ),
                ),
              },
              icon: const Icon(
                Icons.add,
              ),
              label: const Text(
                'PERSON HINZUFÜGEN',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Person {
  Person(this.personName, this.firstLetter);

  String personName;
  String firstLetter;
}
