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
            Image.asset("images/padlock.png", height: 200, width: 200),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 2,
            ),
            const Text("ZUSAMMENFASSUNG DER DATENSCHUTZERKLÄRUNG",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 2,
            ),
            const SizedBox(height: 20),
            const Text(
              "Personenbezogene Daten, die für die folgenden Zwecke und unter Nutzung der folgenden Dienste erhoben werden:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              children: [
                ListTile(
                  title: const Text(
                    'Statistik',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: const Text(
                    'Personenbezogene Daten: Cookies und Nutzungsdaten',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  leading: Icon(
                    Icons.auto_graph,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Kontaktaufnahme mit dem Nutzer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: const Text(
                    'Mailingliste oder Newsletter'
                    'Persönliche Daten: E-Mail Adresse',
                    style: TextStyle(
                      fontSize: 16,
                    ),
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
