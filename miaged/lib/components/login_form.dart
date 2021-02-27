import '../services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: loginController,
          decoration: InputDecoration(
            labelText: "Login",
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
        RaisedButton(
          onPressed: () {
            context.read<AuthenticationService>().signIn(
                  email: loginController.text.trim(),
                  password: passwordController.text.trim(),
                );
          },
          child: Text("Se connecter"),
        )
      ],
    );
  }
}
