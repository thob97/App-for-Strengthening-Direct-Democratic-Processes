import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:swp_direktdem_verf_app/pages/settings.dart';
import 'package:swp_direktdem_verf_app/pages/start.dart';
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
        body: Column(
          children: [
              Image.asset("images/padlock.png",
                height: 200,
                width: 200),
            const Divider(
              color: Colors.grey, thickness: 2,
            ),
            Text("ZUSAMMENFASSUNG DER DATENSCHUTZERKLÄRUNG", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey,
                fontSize: 18,)
            ),
            const Divider(
                color: Colors.grey, thickness: 2,
              ),
            Text("Personenbezogene Daten, die für die folgenden Zwecke und unter Nutzung der folgenden Dienste erhoben werden:",  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey,
    fontSize: 18,),
          ),
            Wrap(
              children:[
                ListTile(
                  title: const Text(
                    'Statistik',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey,
                      fontSize: 16,),
                  ),
                  subtitle: const Text('Personenbezogene Daten: Cookies und Nutzungsdaten', style: TextStyle(color: Colors.grey,
                    fontSize: 16,),),
                  leading: Icon(
                    Icons.auto_graph,
                    color: Colors.purple,
                  ),
                ),
                ListTile(
                title: const Text(
                'Kontaktaufnahme mit dem Nutzer',
    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey,
      fontSize: 16,),
    ),
    subtitle: const Text('Mailingliste oder Newsletter'
        'Persönliche Daten: E-Mail Adresse', style: TextStyle( color: Colors.grey,
      fontSize: 16,),),
    leading: Icon(
    Icons.contact_mail,
    color: Colors.purple,
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
