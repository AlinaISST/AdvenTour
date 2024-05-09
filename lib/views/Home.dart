import 'package:she_masomo/views/widgets/CustomScaffold.dart';
import 'package:she_masomo/views/HomepageRedirect/HomepageItems.dart';
import 'package:she_masomo/views/HomepageRedirect/HomepageItemsLocations.dart';
import 'package:she_masomo/views/HomepageRedirect/HomepageItemsPackages.dart';
import 'package:she_masomo/views/HomepageRedirect/NewsletterCard.dart';
import 'package:she_masomo/views/widgets/CustomScaffold.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final bool _isSmallScreen = MediaQuery.of(context).size.width < 600;
    return CustomScaffold(
      title: "ExploreEra",
      isHomePage: true,
      body: ListView(
        children: [
          // Video background
          SizedBox(
            height: _isSmallScreen ? 100 : 400, // Set the height of the video
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      child: Ink.image(
                        image: AssetImage("assets/images/banner.png"),
                        height: 300,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ExploreEra",
                        style: TextStyle(
                            fontSize: _isSmallScreen ? 20 : 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Plan your trip with us and travel around the world with the most affordable packages!",
                        style: TextStyle(
                            fontSize: _isSmallScreen ? 16 : 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 200,
          ),

          const Text(
            "We have the best services available for you!",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),

          const SizedBox(
            height: 5,
          ),

          // Homepage items
          const Padding(
            padding: EdgeInsets.all(20),
            child: HomepageItems(),
          ),

          const SizedBox(
            height: 30,
          ),

          const Text(
            "Locations",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),

          const SizedBox(
            height: 5,
          ),

          // Homepage items
          const Padding(
            padding: EdgeInsets.all(20),
            child: HomepageItemsLocations(),
          ),

          const SizedBox(
            height: 30,
          ),

          const Text(
            "Packages",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),

          const SizedBox(
            height: 5,
          ),

          // Homepage items
          const Padding(
            padding: EdgeInsets.all(20),
            child: HomepageItemsPackages(),
          ),

          const SizedBox(
            height: 30,
          ),

          const NewsletterCard(),
        ],
      ),
    );
  }
}
