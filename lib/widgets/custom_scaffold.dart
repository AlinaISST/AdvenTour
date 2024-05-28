import 'package:flutter/material.dart';
import 'package:explore_era/Widgets/appbar.dart';
import 'package:explore_era/Widgets/drawer_screen.dart';
import 'package:explore_era/Widgets/bottom_navigation_bar.dart';

class CustomScaffold extends StatelessWidget {

  const CustomScaffold({Key? key, required this.body, required this.Title, this.isHomePage}) : super(key: key);

  final Widget body;
  final String Title;
  final bool? isHomePage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: BaseAppBar(title: Text(Title), appBar: AppBar()),
      drawer: isHomePage == null ? null : const DrawerScreen(), //allergy data
      body: body,
      bottomNavigationBar: MyBottomNavigationBar(isHomePage: isHomePage),
    );
  }
}
