import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/settings.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();

}

class _EditProfilePageState extends State<EditProfilePage> {

  @override
  Widget build(BuildContext context) {
    bool switchValue=false;
    return new Scaffold(
      appBar: const CustomAppBar('Profileinstellungen'),
        body: new Container(
          padding: new EdgeInsets.only(top: 16.0),
          child: new ListView(
            children: <Widget>[
          SizedBox(
          height: 15,
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme
                              .of(context)
                              .scaffoldBackgroundColor
                      ),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2, blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10)
                        )
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://banner2.cleanpng.com/20180516/zq/kisspng-computer-icons-google-account-icon-design-login-5afc02dab4a218.0950785215264652427399.jpg")
                      )
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                        ),
                        color: Colors.purple,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 35,
          ),

          buildTextField("Vorname", "Erika"),
              buildTextField("Nachname", "Mustermann"),
              buildTextField("Email", "name@domain.com"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () {
    showDialog(
    context: context,
    builder: (context) {
    return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    elevation: 16,
    child: Container(
    height: 400.0,
    width: 360.0,
    child: ListView(
    children: <Widget>[
    SizedBox(height: 20),
    Center(
    child: Text(
    "Passwort ändern",
    style: TextStyle(fontSize: 17, color: Colors.white),
    ),
    ),
      SizedBox(height: 20),
    buildTextField("Altes Passwort", "Altes Passwort"),

    SizedBox(height: 20),
      Text(
          "Neues Passwort",
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
      buildTextField("Passwort", "Passwort"),
      buildTextField("Passwort wiederholen", "Passwort wiederholen"),
      RaisedButton(
        onPressed: () {},
        color: Colors.purple,
        padding: EdgeInsets.symmetric(horizontal: 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text("Speichern", style: TextStyle(
            fontSize: 14,
            letterSpacing: 2.2,
            color: Colors.white),
        ),
      )
    ],
    ),
    ),
    );
                    });},
                    color: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Text("PASSWORT ÄNDERN", style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white),
                    ),
                  )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Email Adresse sichtbar machen",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600]),
                    ),
                    Transform.scale(
                        scale: 0.7,
                        child: Switch(
                          value: switchValue,
                          onChanged: (value) {
                            setState(() {
                              switchValue = value;
                            });
                          },
                        ))
                  ]
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text("ABBRECHEN",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Text("SPEICHERN", style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
    );
  }
  Widget buildTextField(String labelText, String placeholder) {
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
                          decoration: new InputDecoration(
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
