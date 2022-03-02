import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swp_direktdem_verf_app/pages/create_new_procedure/new_procedure3.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/my_procedures.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/new_procedure/custom_bottom_navigation_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/new_procedure/input_text.dart';
import 'package:swp_direktdem_verf_app/widgets/new_procedure/input_text_heading.dart';
import 'package:swp_direktdem_verf_app/widgets/new_procedure/page_progress_bar.dart';

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
  String selected = 'Wähle den Themenbereich';
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
      bottomNavigationBar: const CustomBottomNavigationBar(
        onBackWidget: MyProcedures(),
        onContinueWidget: NewProcedure3(),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: <Widget>[
            const PageProgressBar(currentPageNumber: 1),
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
              padding: const EdgeInsets.only(right: 10, bottom: 30, top: 30),
              itemBuilder: (context, i) {
                return ExpansionTile(
                  key: GlobalKey(),
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
  Category(this.title, this.contents);

  final String title;
  List<String> contents = [];
}

List<Category> categories = [
  Category(
    'Themenbereiche',
    [
      'Bildung und Kultur',
      'Demokratie, Staatsorganisation und Innenpolitik',
      'Wirtschaft',
      'Soziales',
      'Gesundheit, Umwelt- und Verbraucherschutz',
      'Verkehr',
      'Sonstiges',
    ],
  ),
];
