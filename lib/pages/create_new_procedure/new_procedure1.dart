import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swp_direktdem_verf_app/pages/create_new_procedure/new_procedure3.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/new_procedure/input_text.dart';
import 'package:swp_direktdem_verf_app/widgets/new_procedure/input_text_heading.dart';

String selected = 'Themenbereiche';

class NewProcedure1 extends StatefulWidget {
  const NewProcedure1({Key? key}) : super(key: key);

  @override
  _NewProcedureState1 createState() => _NewProcedureState1();
}

class _NewProcedureState1 extends State<NewProcedure1> {
  final TextEditingController textEditingControllerDescription =
      TextEditingController();
  final TextEditingController textEditingControllerTitle =
      TextEditingController();
  final TextEditingController textEditingControllerTitelStartDate =
      TextEditingController();
  final TextEditingController textEditingControllerContact =
      TextEditingController();
  final TextEditingController textEditingControllerWebsite =
      TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd.MM.yyyy');

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
          textEditingControllerTitelStartDate.text = formatter.format(picked);
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
                      builder: (context) => const NewProcedure1(),
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
            const InputTextHeading(
              title: 'Titel',
            ),
            InputText(
              placeholder: 'Titel des Volksbegehrens',
              controller: textEditingControllerTitle,
              maxLines: 1,
            ),
            const InputTextHeading(
              title: 'Beschreibung',
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              alignment: Alignment.topLeft,
              child: const Text(
                'Was Sie hier schreiben sollten:\n• Ziele des Verfahrens\n• Motivation ',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
            ),
            InputText(
              placeholder: 'Beschreibung',
              controller: textEditingControllerDescription,
              maxLines: 7,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
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
                      children: _buildExpandableContent(categories[i], i),
                    ),
                  ],
                );
              },
            ),
            InputText(
              placeholder: 'Startdatum',
              controller: textEditingControllerTitelStartDate,
              maxLines: 1,
              suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_today_outlined),
                onPressed: () {
                  _selectDate(context);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Divider(
                thickness: 3,
              ),
            ),
            const InputTextHeading(
              title: 'Kontakt',
            ),
            InputText(
              placeholder: 'Kontakt',
              controller: textEditingControllerContact,
              maxLines: 7,
            ),
            const InputTextHeading(
              title: 'Webseite',
            ),
            InputText(
              placeholder: 'URL der Webseite des Volksbegehrens',
              controller: textEditingControllerWebsite,
              maxLines: 1,
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildExpandableContent(Category category, index) {
    return List.generate(category.contents.length, (index) {
      return ListTile(
        title: Text(
          category.contents[index],
          style: const TextStyle(fontSize: 18.0),
        ),
        onTap: () {
          setState(() {
            selected = category.contents.elementAt(index);
          });
        },
      );
    });
  }
}

class Category {
  Category(this.title, this.contents, this.icon);

  final String title;
  List<String> contents = [];
  final IconData icon;
}

List<Category> categories = [
  Category(
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
