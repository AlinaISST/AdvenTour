import 'package:explore_era/Views/register.dart';
import 'package:explore_era/widgets/custom_scaffold.dart';
import 'package:explore_era/widgets/Helper.dart';
import 'package:flutter/material.dart';
import 'package:explore_era/widgets/newsletter_card.dart';
import 'package:explore_era/Redirects/home_page_items.dart';
import 'package:explore_era/Redirects/homepage_items_locations.dart';
import 'package:explore_era/Redirects/homepage_items_packages.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return CustomScaffold(
      Title: "AdvenTour",
      isHomePage: true,
      body: ListView(
        children: [
          // Video background
          SizedBox(
            height: isSmallScreen ? 100 : 400, // Set the height of the video
            child: Stack(
              fit: StackFit.expand,
              children: [
                //VideoWidget(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      child: Ink.image(
                        image: const AssetImage(
                          "assets/images/banner.png",
                        ),
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
                        "ADVENTOUR",
                        style: TextStyle(
                            fontSize: isSmallScreen ? 20 : 30,
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
                            fontSize: isSmallScreen ? 16 : 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Helper.VideoButton(context, "Register Now",
                          const Register()),
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