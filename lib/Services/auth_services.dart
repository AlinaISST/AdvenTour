import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explore_era/Pages/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthServices {
  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      // show loading
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: LinearProgressIndicator(),
          );
        },
      );

      // try logging in
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: email,
              password: password,
            )
            .whenComplete(() => Navigator.pop(context));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-email') {
          print(e.code);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text('Entered Invaild Email'),
            ),
          );
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text('Entered Invaild Password'),
            ),
          );
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text("Enter credentials.. !!"),
        ),
      );
    }
  }

  Future<void> signUp({
    required BuildContext context,
    required String email,
    required String userName,
    required String password,
    required String phoneNumber,
  }) async {
    if (email.isNotEmpty && password.isNotEmpty && userName.isNotEmpty) {
      // show loading
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: LinearProgressIndicator(),
          );
        },
      );

      // try logging in
      try {
        // UserCredential? userCredential =

        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((userCredential) {
          createUserDocument(userCredential, userName, phoneNumber, context);
        }).whenComplete(() => Navigator.pop(context));

        // ignore: use_build_context_synchronously
      } on FirebaseAuthException catch (e) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(e.code),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text("Enter values...!!!"),
        ),
      );
    }
  }

  createUserDocument(UserCredential userCredential, String userName,
      String phoneNumber, BuildContext context) async {
    if (userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'userName': userName,
        'phoneNumber': phoneNumber,
      });
    }
  }

  updateUserDocument(User user, String userName, String fullName) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.email)
        .update({
      'email': user.email,
      'username': userName,
      'fullName': fullName,
    });
  }
}
