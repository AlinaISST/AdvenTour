import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Appbar.dart';
import 'DrawerScreen.dart';
import 'MyBottomNavigationBar.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {Key? key, required this.body, required this.title, this.isHomePage})
      : super(key: key);

  final Widget body;
  final String title;
  final bool? isHomePage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: BaseAppBar(
        title: Text(title),
        appBar: AppBar(),
      ),
      drawer: isHomePage == null ? null : const DrawerScreen(), //allergy data
      body: body,
    );
  }
}
