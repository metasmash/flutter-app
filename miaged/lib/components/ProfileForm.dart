import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:miaged/services/authentication_service.dart';
import 'package:miaged/services/user_service.dart';
import '../services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileForm extends StatelessWidget {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: UserService(FirebaseAuth.instance).getUserInformation(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData) {
            var data = snapshot.data;
            return Scaffold(
              body: SingleChildScrollView(
                  reverse: true,
                  child: Center(
                      child: FractionallySizedBox(
                          widthFactor: 0.9,
                          child: Column(
                            children: [
                              TextField(
                                showCursor: false,
                                readOnly: true,
                                controller: loginController
                                  ..text = UserService.getUsername(),
                                decoration: InputDecoration(
                                  labelText: "Username",
                                ),
                              ),
                              TextField(
                                obscureText: true,
                                autocorrect: false,
                                enableSuggestions: false,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                ),
                              ),
                              TextField(
                                controller: birthDateController
                                  ..text = data['anniversaire'],
                                decoration: InputDecoration(
                                  labelText: "Anniversaire",
                                ),
                              ),
                              TextField(
                                controller: addressController
                                  ..text = data['adresse'],
                                decoration: InputDecoration(
                                  labelText: "Adresse",
                                ),
                              ),
                              TextField(
                                controller: zipCodeController
                                  ..text = '${data['zipcode']}',
                                decoration: InputDecoration(
                                  labelText: "Code postale",
                                ),
                              ),
                              TextField(
                                controller: cityController
                                  ..text = data['ville'],
                                decoration: InputDecoration(
                                  labelText: "Ville",
                                ),
                              ),
                              RaisedButton(
                                  onPressed: () {
                                    UserService(FirebaseAuth.instance)
                                        .changePassword(
                                            newPassword:
                                                passwordController.text.trim());
                                    UserService(FirebaseAuth.instance)
                                        .setUserInformation(
                                            adresse:
                                                addressController.text.trim(),
                                            anniversaire:
                                                birthDateController.text.trim(),
                                            ville: cityController.text.trim(),
                                            zipcode:
                                                zipCodeController.text.trim());
                                  },
                                  child: Text("Changer les informations"),
                                  color: Colors.blueAccent),
                              RaisedButton(
                                color: Colors.redAccent,
                                onPressed: () {
                                  context
                                      .read<AuthenticationService>()
                                      .signOut();
                                },
                                child: Text("Sign out",
                                    style: TextStyle(color: Colors.white)),
                              )
                            ],
                          )))),
            );
          }
          return LoadingBumpingLine.circle(
              borderColor: Colors.cyan,
              backgroundColor: Colors.redAccent,
              duration: Duration(milliseconds: 80));
        });
  }
}
