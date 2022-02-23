import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/create_new_procedure/new_procedure3.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/my_procedures.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/new_procedure/custom_bottom_navigation_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/new_procedure/input_text_heading.dart';
import 'package:swp_direktdem_verf_app/widgets/new_procedure/page_progress_bar.dart';

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
      bottomNavigationBar: const CustomBottomNavigationBar(
        onBackWidget: NewProcedure3(),
        onContinueWidget: MyProcedures(),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: <Widget>[
            const PageProgressBar(currentPageNumber: 3),
            const InputTextHeading(
              title: 'Redakteure',
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
                bottom: 30,
              ),
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
                        child: const Text('Abbrechen'),
                        onPressed: () {
                          textEditingControllerPersonname.clear();
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Bestätigen'),
                        onPressed: () {
                          personList.add(
                            Person(
                              textEditingControllerPersonname.value.text,
                              textEditingControllerPersonname.value.text
                                  .substring(0, 1),
                            ),
                          );
                          textEditingControllerPersonname.clear();
                          Navigator.of(context).pop();
                          setState(() {});
                        },
                      ),
                    ],
                    title: const Text('Person hinzufügen'),
                    content: TextField(
                      onChanged: (value) {},
                      controller: textEditingControllerPersonname,
                      decoration: const InputDecoration(
                        hintText: 'E-Mail Adresse des Redakteurs',
                      ),
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
