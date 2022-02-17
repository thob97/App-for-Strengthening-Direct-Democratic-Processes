import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swp_direktdem_verf_app/pages/create_new_procedure/new_procedure3.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/my_procedures.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

TextEditingController textEditingControllerBeschreibung =
TextEditingController();
TextEditingController textEditingControllerTitelDesVolksbegehrens =
TextEditingController();
TextEditingController textEditingControllerTitelStartdatum =
TextEditingController();
TextEditingController textEditingControllerKontakt = TextEditingController();
TextEditingController textEditingControllerWebsite = TextEditingController();
String selected = 'Themenbereiche';


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
        lastDate: DateTime(2101),
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          textEditingControllerTitelStartdatum.text = formatter.format(picked);
        });
      }
    }

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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  primary: const Color(0xFF194C76),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyProcedures(),
                    ),
                  );
                },
                child: const Text(
                  'ZURÜCK',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2.2,
                    color: Colors.white,
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
                  shadowColor: Colors.transparent,
                  primary: const Color(0xFF194C76),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
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
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 45, right: 10, top: 10),
                    child: Container(
                      width: 35.0,
                      height: 35.0,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Text('1'),
                    ),
                  ),
                  Container(
                    height: 1.0,
                    width: 80.0,
                    color: Colors.black,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Container(
                      width: 35.0,
                      height: 35.0,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: const Text('2'),
                    ),
                  ),
                  Container(
                    height: 1.0,
                    width: 80.0,
                    color: Colors.black,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Container(
                      width: 35.0,
                      height: 35.0,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: const Text('3'),
                    ),
                  ),
                ],
              ),),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(
                padding: const EdgeInsets.only(right: 10, top: 10),
                alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                ),
                child: const Text(
                  'Titel',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: TextField(
                controller: textEditingControllerTitelDesVolksbegehrens,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Titel des Volksbegehrens',
                  //fillColor: Colors.white,
                  //filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Container(
                padding: const EdgeInsets.only(right: 10, top: 20),
                alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                ),
                child: const Text(
                  'Beschreibung',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              alignment: Alignment.topLeft,
              child: const Text(
                'Was sollten Sie hier schreiben\n• Ziele\n• Motivation ',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: TextField(
                maxLines: 7,
                controller: textEditingControllerBeschreibung,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Beschreibung',
                  //fillColor: Colors.white,
                  //filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: themenbereiche.length,
              padding: const EdgeInsets.only(right: 10, bottom: 30),
              itemBuilder: (context, i) {
                return ExpansionTile(
                  title: Text(
                    selected,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  children: <Widget>[
                    Column(
                      children: _buildExpandableContent(themenbereiche[i], i),
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
                bottom: 15,
              ),
              child: TextField(
                controller: textEditingControllerTitelStartdatum,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Startdatum',
                  //fillColor: Colors.white,
                  //filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today_outlined),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(thickness: 3, color: Colors.purple),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Container(
                padding: const EdgeInsets.only(right: 10, top: 20),
                alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                ),
                child: const Text(
                  'Kontakt',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: TextField(
                controller: textEditingControllerKontakt,
                maxLines: 7,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Kontakt',
                  //fillColor: Colors.white,
                  //filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Container(
                padding: const EdgeInsets.only(right: 10, top: 20),
                alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                ),
                child: const Text(
                  'Website',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
                bottom: 15,
              ),
              child: TextField(
                controller: textEditingControllerWebsite,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Website des Volksbegehrens',
                  //fillColor: Colors.white,
                  //filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  List<Widget> _buildExpandableContent(Themenbereich themenbereich, index) {
    return List.generate(themenbereich.contents.length, (index) {
      return ListTile(
        title: Text(
          themenbereich.contents[index],
          style: const TextStyle(fontSize: 18.0),
        ),
        onTap: () {
          setState(() {
            selected = themenbereich.contents.elementAt(index);
          });
        },
      );
    });
  }

}


class Themenbereich {
  Themenbereich(this.title, this.contents, this.icon);

  final String title;
  List<String> contents = [];
  final IconData icon;
}

List<Themenbereich> themenbereiche = [
  Themenbereich(
    'Themenbereiche',
    [
      '1. Themenbereich',
      '2. Themenbereich',
      '3. Themenbereich',
      '4. Themenbereich',
      '3. Themenbereich',
      '4. Themenbereich',
      '3. Themenbereich',
      '4. Themenbereich'
    ],
    Icons.close,
  ),
];