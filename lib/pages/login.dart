import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/register.dart';
import 'package:swp_direktdem_verf_app/pages/settings.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  String email = 'name@domain.de';
  String password = '******';
  bool showPassword=false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: const CustomAppBar('Login'),
      body: new Container(
        padding: new EdgeInsets.only(top: 16.0),
        child: new ListView(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),

            buildTextField("Email", "name@domain.com", false),
            buildTextField("Passwort", "******", true),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  },
                  color: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text("LOGIN", style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                      color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("oder"),
                ]),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );},
                  color: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text("REGISTRIEREN", style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                      color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField) {
    return Column(
        children:[
          Padding(
            padding: const EdgeInsets.only(bottom: 35.0, ),
            child: Container(
              height: 60,
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  autofocus: false,
                  onTap: () {},
  obscureText: isPasswordTextField ? showPassword : false,
                  decoration: new InputDecoration(
  suffix: isPasswordTextField
  ? IconButton(
  onPressed: () {
  setState((){
  showPassword = !showPassword;
  });
  },
  icon: Icon(
  Icons.remove_red_eye,
  color: Colors.grey,
  ),
  ) : null,

                      border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 2),),

                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: "  "+labelText,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "  "+placeholder,
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white54,
                      ),
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white12
                      )),
                ),
              ),
            ),
          )]);

  }
}