import 'package:explore_era/Pages/Register.dart';
import 'package:explore_era/Pages/SignIn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return SignIn(
        onTap: togglePages,
      );
    } else {
      return Register(
        onTap: togglePages,
      );
    }
  }
}
