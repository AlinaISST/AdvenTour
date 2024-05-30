import 'package:explore_era/Pages/LoginOrRegisterPage.dart';
import 'package:explore_era/Pages/SignIn.dart';
import 'package:explore_era/Pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              return const MyHome();
            } else {
              return LoginOrRegisterPage();
            }
          }
        },
      ),
    );
  }
}
