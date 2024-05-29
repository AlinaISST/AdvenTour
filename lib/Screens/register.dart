// ignore_for_file: use_build_context_synchronously

import 'package:explore_era/Model/user.dart';
import 'package:explore_era/Screens/sign_in.dart';
import 'package:provider/provider.dart';
import 'package:explore_era/Notifier/user.notifier.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const List<Widget> consents = <Widget>[
  Text('Yes'),
  Text('No'),
];

const List<Widget> sex = <Widget>[
  Text('Male'),
  Text('Female'),
];

List<DropdownMenuItem<String>> get preferredDestination {
  List<DropdownMenuItem<String>> destination = [
    const DropdownMenuItem(value: "Kashmir", child: Text('Kashmir')),
    const DropdownMenuItem(value: "Istanbul", child: Text('Istanbul')),
    const DropdownMenuItem(value: "Paris", child: Text('Paris')),
    const DropdownMenuItem(value: "Bali", child: Text('Bali')),
    const DropdownMenuItem(value: "Dubai", child: Text('Dubai')),
    const DropdownMenuItem(value: "Geneva", child: Text('Geneva')),
    const DropdownMenuItem(value: "London", child: Text('London')),
    const DropdownMenuItem(value: "Rome", child: Text('Rome')),
  ];
  return destination;
}

List<DropdownMenuItem<String>> get preferredPackage {
  List<DropdownMenuItem<String>> package = [
    const DropdownMenuItem(value: "Bronze", child: Text('Bronze')),
    const DropdownMenuItem(value: "Silver", child: Text('Silver')),
    const DropdownMenuItem(value: "Gold", child: Text('Gold')),
    const DropdownMenuItem(value: "Platinum", child: Text('Platinum')),
  ];
  return package;
}

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Container(
        alignment: Alignment.center,
        child: isSmallScreen
            ? const SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _Logo(),
                    _FormContent(),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _Logo(),
                      SizedBox(width: 60),
                      Center(
                        child: _FormContent(),
                      ),
                    ],
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
            width: isSmallScreen ? 50 : 150,
            height: isSmallScreen ? 50 : 150),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Welcome to ExploreEra \n Registration Form",
            textAlign: TextAlign.center,
            style: isSmallScreen
                ? Theme.of(context).textTheme.headlineMedium
                : Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: const Color(0xFF29395B), fontWeight: FontWeight.bold),
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
  String? gender;
  final List<bool> _selectedGender = <bool>[false, false];

  String? status;
  final List<bool> selectedStatus = <bool>[false, false];

  List<bool> selectedDestination = List.generate(
      8,
      (_) =>
          false); // Initialize with 8 elements, assuming there are 8 destinations
  List<String> destinations = [
    "Kashmir",
    "Istanbul",
    "Paris",
    "Bali",
    "Dubai",
    "Geneva",
    "London",
    "Rome"
  ];

  List<bool> selectedPackage = List.generate(
      4,
      (_) =>
          false); // Initialize with 8 elements, assuming there are 8 destinations
  List<String> packages = ["Bronze", "Silver", "Gold", "Platinum"];

  String selectedValue1 = "Kashmir";

  String selectedValue2 = "Bronze";
/*

  String? destination;
  final List<bool> selectedDestination = <bool>[false, false, false, false, false, false, false, false];

  String? package;
  final List<bool> _selectedPackage = <bool>[false, false, false, false];
*/

  bool rememberMe = false;
  bool _termsAndConditions = false;
  bool newsletter = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              validator: (value) {
                // add name
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regex = RegExp(pattern);
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!regex.hasMatch(value)) {
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
              controller: usernameController,
              validator: (value) {
                // add name
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
                prefixIcon: Icon(Icons.account_circle_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            _gap(),
            TextFormField(
              controller: passwordController,
              validator: (value) {
                // add name
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid password';
                }
                return null;
              },
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Create a password',
                prefixIcon: Icon(Icons.lock_outline_rounded),
                border: OutlineInputBorder(),
              ),
            ),
            _gap(),
            TextFormField(
              controller: phoneNumberController,
              validator: (value) {
                // add birthday
                if (value == null || value.isEmpty) {
                  return 'Please enter your contact info';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
                prefixIcon: Icon(Icons.phone_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            _gap(),
            ListTile(
              title: const Text("Gender"),
              trailing: ToggleButtons(
                onPressed: (int index) {
                  setState(() {
                    // The button that is tapped is set to true, and the others to false.
                    for (int i = 0; i < _selectedGender.length; i++) {
                      _selectedGender[i] = i == index;
                    }
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(2)),
                selectedBorderColor: const Color(0xFFe65c00),
                selectedColor: const Color(0xFFe65c00),
                fillColor: const Color(0xFFfcf3e8),
                color: Colors.black54,
                constraints: BoxConstraints(
                  minHeight: isSmallScreen
                      ? MediaQuery.of(context).size.height * 0.04
                      : MediaQuery.of(context).size.height * 0.04,
                  minWidth: isSmallScreen
                      ? MediaQuery.of(context).size.height * 0.06
                      : MediaQuery.of(context).size.height * 0.08,
                ),
                isSelected: _selectedGender,
                children: sex,
              ),
            ),
            CheckboxListTile(
              value: _termsAndConditions,
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _termsAndConditions = value;
                });
              },
              subtitle: !_termsAndConditions
                  ? const Text(
                      'required',
                      style: TextStyle(color: Colors.red),
                    )
                  : null,
              title: const Text('I agree to the Terms and Conditions'),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              contentPadding: const EdgeInsets.all(0),
            ),
            _gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 16,
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
                    final String userName = usernameController.text;
                    final String phoneNumber = phoneNumberController.text;

                    final User newUser = User(
                      email: email,
                      password: password,
                      phoneNumber: phoneNumber,
                      userName: userName,
                    );

                    userNotifier.adduser(newUser);

                    final key = email.split('@')[0];

                    final SharedPreferences sharedPref =
                        await SharedPreferences.getInstance();

                    final userSaved =
                        await sharedPref.setString(key, userToJson(newUser));

                    if (userSaved) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('User Created Success'),
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignIn(),
                        ),
                      );
                    } else {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Something went wrong'),
                        ),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 13);
}
