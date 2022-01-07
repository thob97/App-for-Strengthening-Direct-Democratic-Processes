import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class DataSecurity extends StatefulWidget {
  const DataSecurity({Key? key}) : super(key: key);

  @override
  _DataSecurityState createState() => _DataSecurityState();
}

class _DataSecurityState extends State<DataSecurity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar('Datenschutzbestimmungen'),
        body: ListView(
          children: [
            Image.asset('images/padlock.png', height: 200, width: 200),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 2,
            ),
            Text('ZUSAMMENFASSUNG DER DATENSCHUTZERKLÄRUNG',
                textAlign: TextAlign.center,
                style: TextTheme().headline2),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 2,
            ),
            const SizedBox(height: 20),
            Text(
              'Personenbezogene Daten, die für die folgenden Zwecke und\nunter Nutzung der folgenden Dienste erhoben werden:',
                textAlign: TextAlign.center,
                style: TextTheme().headline2
            ),
            const SizedBox(height: 20),
            Wrap(
              children: [
                ListTile(
                  title: Text(
                    'Statistik',
                    style: TextTheme().bodyText2,
                  ),
                  subtitle: Text(
                    'Personenbezogene Daten: Cookies und\n Nutzungsdaten',
                    style: TextTheme().bodyText2,
                  ),
                  leading: Icon(
                    Icons.auto_graph,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Kontaktaufnahme mit dem Nutzer',
                      style: TextTheme().bodyText2,
                  ),
                  subtitle: Text(
                    'Mailingliste oder Newsletter\nPersönliche Daten: E-Mail Adresse',
                      style: TextTheme().bodyText2
                  ),
                  leading: Icon(
                    Icons.contact_mail,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        )

//      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
  }
}
