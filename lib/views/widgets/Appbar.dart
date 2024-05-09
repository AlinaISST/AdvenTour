import 'package:flutter/material.dart';
import 'package:she_masomo/views/HomepageRedirect/AboutUs.dart';
import 'package:she_masomo/views/Location.dart';
import 'package:she_masomo/views/Packages.dart';
import '../Home.dart';
import 'Helper.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.indigo;
  final Text title;
  final AppBar appBar;
  //static Provider provider = Provider("");

  /// you can add more fields that meet your needs

  const BaseAppBar({Key? key, required this.title, required this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title.data.toString(),
        style: const TextStyle(
          shadows: [
            BoxShadow(
              color: Color(0xFFffffff),
              //blurRadius: 1.0,
              //spreadRadius: 1.0,
              blurStyle: BlurStyle.outer,
              //offset: Offset(1.0, 1.0),
            ),
          ],
          color: Color(0xFFffffff),
          fontWeight: FontWeight.bold,
        ),
      ),

      centerTitle: false,
      backgroundColor: const Color(0xFF29395B),
      //const Color(0xFF154a4a),

      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Helper.AppButton(
            context,
            "Location",
            const LocationPage(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Helper.AppButton(
            context,
            "Packages",
            const PackagesPage(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Helper.AppButton(context, "About Us", const AboutUs()),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Helper.AppButton(context, "Contact Us", Home()),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
