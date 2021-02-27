import 'package:miaged/components/ProfileForm.dart';
import '../../services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profil extends StatefulWidget {
  Profil({Key key}) : super(key: key);

  @override
  _Profil createState() => _Profil();
}

class _Profil extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return ProfileForm();
  }
}
