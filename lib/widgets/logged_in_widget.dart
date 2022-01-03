import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swp_direktdem_verf_app/home.dart';
import 'package:swp_direktdem_verf_app/pages/provider/google_sign_in.dart';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final user = _firebaseAuth.currentUser!;
    _signOut() async {
      await _firebaseAuth.signOut();
    }
    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Logged In',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          if (user.photoURL != null)
            CircleAvatar(
              maxRadius: 25,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
          if (user.photoURL == null)
            CircleAvatar(
              maxRadius: 25,
              backgroundImage: NetworkImage('https://banner2.cleanpng.com/20180516/zq/kisspng-computer-icons-google-account-icon-design-login-5afc02dab4a218.0950785215264652427399.jpg',
              ),
            ),
          SizedBox(height: 8),
          if (user.displayName != null)
            Text(
              'Name: ' + user.displayName!,
              style: TextStyle(color: Colors.white),
            ),
          SizedBox(height: 8),
          Text(
            'Email: ' + user.email!,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () async {
              final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
              await _signOut();
              if (user == null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              }

            },
            child: Text('Logout'),
          )
        ],
      ),
    );
  }
}
