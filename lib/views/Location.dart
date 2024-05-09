import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:she_masomo/views/Home.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Locations',
          style: TextStyle(
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: <Widget>[
                  buildMaterial(
                    context,
                    "India",
                    "Kashmir",
                    "assets/images/kashmir.png",
                    const Home(),
                  ),
                  buildMaterial(
                    context,
                    "Turkey",
                    "Istanbul",
                    "assets/images/istanbul.png",
                    const Home(),
                  ),
                  buildMaterial(
                    context,
                    "France",
                    "Paris",
                    "assets/images/pariss.png",
                    const Home(),
                  ),
                  buildMaterial(
                    context,
                    "Indonesia",
                    "Bali",
                    "assets/images/balii.png",
                    const Home(),
                  ),
                  buildMaterial(
                    context,
                    "United Arab Emirates",
                    "Dubai",
                    "assets/images/dubai.png",
                    const Home(),
                  ),
                  buildMaterial(
                    context,
                    "Switzerland",
                    "Geneva",
                    "assets/images/genevaa.png",
                    const Home(),
                  ),
                  buildMaterial(
                    context,
                    "United Kingdom",
                    "London",
                    "assets/images/london.png",
                    const Home(),
                  ),
                  buildMaterial(
                    context,
                    "Italy",
                    "Rome",
                    "assets/images/rome.png",
                    const Home(),
                  ),
                  buildMaterial(
                    context,
                    "India",
                    "Kashmir",
                    "assets/images/kashmir.png",
                    const Home(),
                  ),
                  buildMaterial(
                    context,
                    "Turkey",
                    "Istanbul",
                    "assets/images/istanbul.png",
                    const Home(),
                  ),
                  buildMaterial(
                    context,
                    "France",
                    "Paris",
                    "assets/images/pariss.png",
                    const Home(),
                  ),
                  buildMaterial(
                    context,
                    "Indonesia",
                    "Bali",
                    "assets/images/balii.png",
                    const Home(),
                  ),
                  buildMaterial(
                    context,
                    "United Arab Emirates",
                    "Dubai",
                    "assets/images/dubai.png",
                    const Home(),
                  ),
                  buildMaterial(
                    context,
                    "Switzerland",
                    "Geneva",
                    "assets/images/genevaa.png",
                    const Home(),
                  ),
                  buildMaterial(
                    context,
                    "United Kingdom",
                    "London",
                    "assets/images/london.png",
                    const Home(),
                  ),
                  buildMaterial(
                    context,
                    "Italy",
                    "Rome",
                    "assets/images/rome.png",
                    const Home(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Material buildMaterial(BuildContext context, String name, String subtext,
    String image, Widget page) {
  return Material(
    color: const Color(0xFFFFFFFF),
    elevation: 10,
    borderRadius: BorderRadius.circular(10),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: InkWell(
      splashColor: Colors.black26,
      //onTap: (){},
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Ink.image(
            image: AssetImage(image),
            height: 300,
            width: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            subtext,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF565656),
              fontFamily: 'Comfortaa',
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    ),
  );
}
