import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/settings.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/register.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = 'name@domain.de';
  String password = '******';
  bool showPassword = true;
  bool showConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Login'),
      body: Container(
        padding: const EdgeInsets.only(top: 16.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            buildTextField(
              'Email',
              'name@domain.com',
            ),
            buildTextField(
              'Passwort',
              '******',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Settings()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'LOGIN',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('oder'),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'REGISTRIEREN',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
    String labelText,
    String placeholder,
  ) {
    Widget child;
    if (labelText == 'Passwort') {
      child = TextField(
        onTap: () {},
        obscureText: showPassword,
        decoration: InputDecoration(
          labelText: '  $labelText',
          suffixIcon: IconButton(
            icon: const Icon(Icons.remove_red_eye),
            onPressed: () => setState(
              () => showPassword = !showPassword,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: '  $placeholder',
          labelStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          hintStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else if (labelText == 'Passwort wiederholen') {
      child = TextField(
        onTap: () {},
        obscureText: showConfirmPassword,
        decoration: InputDecoration(
          labelText: '  $labelText',
          suffixIcon: IconButton(
            icon: const Icon(Icons.remove_red_eye),
            onPressed: () => setState(
              () => showConfirmPassword = !showConfirmPassword,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: '  $placeholder',
          labelStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          hintStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      child = TextField(
        onTap: () {},
        decoration: InputDecoration(
          labelText: '  $labelText',
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: '  $placeholder',
          labelStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          hintStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 35.0,
          ),
          child: SizedBox(
            height: 60,
            width: 350,
            child: child,
          ),
        ),
      ],
    );
  }
}
