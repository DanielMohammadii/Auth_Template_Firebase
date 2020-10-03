import 'package:auth_tempalate/models/CustomUser.dart';
import 'package:auth_tempalate/screens/authentication/authenticate.dart';
import 'package:auth_tempalate/screens/authentication/login_screen.dart';
import 'package:auth_tempalate/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
