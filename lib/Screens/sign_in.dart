import 'dart:async';

import 'package:explore_era/Model/user.dart';
import 'package:explore_era/Screens/ticket_booking.dart';
import 'package:provider/provider.dart';
import 'package:explore_era/Notifier/user.notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register.dart';

const List<Widget> consents = <Widget>[
  Text('Yes'),
  Text('No'),
];

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Container(
        alignment: Alignment.center,
        child: isSmallScreen
            ? const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _Logo(),
                  SizedBox(height: 30),
                  _FormContent(),
                ],
              )
            : const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Logo(),
                  SizedBox(width: 60),
                  Center(
                    child: _FormContent(),
                  ),
                ],
              ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 15,
        ),
        Image.asset("assets/images/logo-black.png",
            width: isSmallScreen ? 100 : 250,
            height: isSmallScreen ? 100 : 250),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Welcome to ExploreEra",
            textAlign: TextAlign.center,
            style: isSmallScreen
                ? Theme.of(context).textTheme.headlineMedium
                : Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: const Color(0xFF333333),
                    ),
          ),
        )
      ],
    );
  }
}

class _FormContent extends StatefulWidget {
  const _FormContent();

  @override
  State<_FormContent> createState() => __FormContentState();
}

class __FormContentState extends State<_FormContent> {
  final bool rememberMe = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    // final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _gap(),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  // add name
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regex = RegExp(pattern);
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!regex.hasMatch(value)){
                    return 'You entered wrong email...';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.alternate_email_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              _gap(),
              TextFormField(
                controller: passwordController,
                validator: (value) {
                  // add name
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  border: OutlineInputBorder(),
                ),
              ),
              _gap(),
              // CheckboxListTile(
              //   value: _rememberMe,
              //   onChanged: (value) {
              //     if (value == null) return;
              //     setState(() {
              //       _rememberMe = value;
              //     });
              //   },
              //   title: const Text('Remember me'),
              //   controlAffinity: ListTileControlAffinity.leading,
              //   dense: true,
              //   contentPadding: const EdgeInsets.all(0),
              // ),
              // _gap(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 16,
                        // color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            content: LinearProgressIndicator(),
                          );
                        },
                      );

                      final String email = emailController.text;
                      final String password = passwordController.text;

                      final key = email.split('@')[0];

                      final SharedPreferences sharedPref =
                          await SharedPreferences.getInstance();
                      final String? userString = sharedPref.getString(key);

                      Timer(const Duration(seconds: 2), () {
                        if (userString == null) {
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                          showDialog(
                            // ignore: use_build_context_synchronously
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                content: Text('User not found'),
                              );
                            },
                          );
                        } else {
                          final User user = userFromJson(userString);

                          userNotifier.adduser(user);

                          if (user.email == email) {
                            if (user.password == password) {
                              Navigator.pop(context);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Login Successfull'),
                                ),
                              );

                              Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                  // builder: (context) => const Home(),
                                  builder: (context) => const TicketBooking(),
                                ),
                              );
                            } else {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text('Entered wrong password'),
                                  );
                                },
                              );
                            }
                          } else {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Text('Entered wrong email'),
                                );
                              },
                            );
                          }
                        }
                      });
                    }
                  },
                ),
              ),
              _gap(),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Don't have an account yet?",
                      style: TextStyle(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const Register(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Up!",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF29395B),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 13);
}