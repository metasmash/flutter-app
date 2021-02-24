import '../../services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// This is the stateful widget that the main application instantiates.
class Profil extends StatefulWidget {
  Profil({Key key}) : super(key: key);

  @override
  _Profil createState() => _Profil();
}

class _Profil extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Profile"),
            RaisedButton(
              onPressed: () {
                context.read<AuthenticationService>().signOut();
              },
              child: Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
