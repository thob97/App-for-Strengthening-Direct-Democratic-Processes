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
            color: Theme.of(context).colorScheme.primary,
            thickness: 2,
          ),
          Text(
            'ZUSAMMENFASSUNG DER \nDATENSCHUTZERKLÄRUNG',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2,
          ),
          Divider(
            color: Theme.of(context).colorScheme.primary,
            thickness: 2,
          ),
          const SizedBox(height: 20),
          Text(
            'Personenbezogene Daten, die für die folgenden \nZwecke und unter Nutzung der folgenden Dienste \nerhoben werden:',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(height: 20),
          ListTile(
            title: Text(
              'Statistik',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            subtitle: Text(
              'Personenbezogene Daten: \nCookies und Nutzungsdaten',
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.left,
            ),
            leading: Icon(
              Icons.auto_graph,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          ListTile(
            title: Text(
              'Kontaktaufnahme mit dem Nutzer',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            subtitle: Text(
              'Mailingliste oder Newsletter \nPersönliche Daten: E-Mail Adresse',
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.left,
            ),
            leading: Icon(
              Icons.contact_mail,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
