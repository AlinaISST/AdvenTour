import 'package:explore_era/Screens/home_page.dart';
import 'package:flutter/material.dart';

class HomepageItemsLocations extends StatelessWidget {
  const HomepageItemsLocations({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(10.0),
          ),
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: <Widget>[
              buildMaterial(
                context,
                "Pakistan",
                "Kashmir",
                "assets/images/kashmir.png",
              ),
              buildMaterial(
                context,
                "Turkey",
                "Istanbul",
                "assets/images/istanbul.png",
              ),
              buildMaterial(
                context,
                "France",
                "Paris",
                "assets/images/pariss.png",
              ),
              buildMaterial(
                context,
                "Indonesia",
                "Bali",
                "assets/images/balii.png",
              ),
              buildMaterial(
                context,
                "United Arab Emirates",
                "Dubai",
                "assets/images/dubai.png",
              ),
              buildMaterial(
                context,
                "Switzerland",
                "Geneva",
                "assets/images/genevaa.png",
              ),
              buildMaterial(
                context,
                "United Kingdom",
                "London",
                "assets/images/london.png",
              ),
              buildMaterial(
                context,
                "Italy",
                "Rome",
                "assets/images/rome.png",
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Color activebuttoncolor = const Color(0xFFFFFFFF); //0xFF9bc1c0
  static Color inactivebuttoncolor = const Color(0xFFa4a4a4);

  Material buildMaterial(
      BuildContext context, String name, String subtext, String image) {
    return Material(
      color: const Color(0xFFFFFFFF),
      elevation: 10,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
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
    );
  }
}
