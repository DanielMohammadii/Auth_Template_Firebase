import 'package:auth_tempalate/screens/authentication/login_screen.dart';
import 'package:auth_tempalate/screens/authentication/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSigIn = true;
  void toggleView() {
    setState(() => showSigIn = !showSigIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSigIn) {
      return LoginScreen(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
