import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/create_new_procedure/new_procedure1.dart';
import 'package:swp_direktdem_verf_app/pages/create_new_procedure/new_procedure3.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewProcedure1(),
                    ),
                  );
                },
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
                    bottom: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                ),
                child: const Text(
                  'Phasenauswahl',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              alignment: Alignment.topLeft,
              child: const Text(
                'Hinweise zum Vorgehen: \n1. Wähle durch Anklicken eines Kastens die '
                'Phase \naus, in der sich das Verfahren momentan befindet.\nIm Moment der Auswahl werden'
                ' mehr Details zu der\n gewählten Phase angezeigt. '
                '\n\n2. Setze Häkchen für alle zum '
                'Phasenabschluss \nnötigen Bedingungen, die für dieses Verfahren schon \nerfüllt wurden. '
                'Die Endbedingung kann erst \nausgwählt werden, wenn alle anderen Bedingungen\n erfüllt '
                'wurden. '
                '\n\n3. Wenn alle Angaben zum Fortschritt des Verfahrens\ngemacht wurden, clicke am Ende der Seite auf Weiter.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
              child: Container(
                height: 280,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: const Text('1a'),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 123, right: 10),
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
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 52, right: 10),
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
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 32, right: 10),
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
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      text: const TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Startbedingung: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                'Antrag auf amtliche \nKostenschätzung stellen',
                          ),
                          TextSpan(
                            text: '\n\nReferenzdauer: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '8 Monate'),
                          TextSpan(
                            text: '\n\nZu erfüllen vor Phasenabschluss:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: '\n\nAmtliche Kosteneinschätzung ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '\n  •Zeit: 2 Monate (bis <<Datum>>)'),
                          TextSpan(text: '\n  •Erfüllt am: <<Datum>>'),
                          TextSpan(
                            text: '\n\nUnterschriftensammlung ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '\n  •Zeit: 6 Monate (bis <<Datum>>)'),
                          TextSpan(
                            text: '\n\nAntrag auf Volksbegehren stellen ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '\n  •Endbedingung dieser Phase'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: const Text('1b'),
                        ),
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Startbedingung: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                'Antrag auf amtliche \nKostenschätzung stellen',
                          ),
                          TextSpan(
                            text: '\n\nReferenzdauer: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '9-11 Monate und 15 Tage'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: const Text('2a'),
                        ),
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Startbedingung: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                'Antrag auf amtliche \nKostenschätzung stellen',
                          ),
                          TextSpan(
                            text: '\n\nReferenzdauer: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '9-11 Monate und 15 Tage'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: const Text('2b'),
                        ),
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Startbedingung: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                'Antrag auf amtliche \nKostenschätzung stellen',
                          ),
                          TextSpan(
                            text: '\n\nReferenzdauer: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '9-11 Monate und 15 Tage'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: const Text('3'),
                        ),
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Startbedingung: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                'Antrag auf amtliche \nKostenschätzung stellen',
                          ),
                          TextSpan(
                            text: '\n\nReferenzdauer: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '9-11 Monate und 15 Tage'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Vehicle {
  Vehicle(this.title, this.contents, this.icon);

  final String title;
  List<String> contents = [];
  final IconData icon;
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
  Data(this.title, this.contents, this.icon);

  final String title;
  List<String> contents = [];
  final IconData icon;
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
