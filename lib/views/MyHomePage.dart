import 'package:adventour/views/widgets/Helper.dart';
import 'package:flutter/material.dart';
import 'HomepageRedirect/HomepageItems.dart';
import 'HomepageRedirect/HomepageItemsLocations.dart';
import 'HomepageRedirect/HomepageItemsPackages.dart';
import 'HomepageRedirect/NewsletterCard.dart';
import 'HomepageRedirect/VideoWidget.dart';
import 'widgets/CustomScaffold.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    final bool _isSmallScreen = MediaQuery.of(context).size.width < 600;

    return CustomScaffold(Title:"AdvenTour", isHomePage: true,
      body: ListView(
        children: [
          // Video background
          SizedBox(
            height: _isSmallScreen ? 100 : 400, // Set the height of the video
            child: Stack(
              fit: StackFit.expand,
              children: [
                //VideoWidget(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                        child: Ink.image(image: AssetImage("assets/images/banner.png"),
                    height: 300, width: 300, fit: BoxFit.cover,),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ADVENTOUR",
                        style: TextStyle(fontSize: _isSmallScreen ? 20 : 30, fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30,),
                      Text(
                        "Plan your trip with us and travel around the world with the most affordable packages!",
                        style: TextStyle(fontSize: _isSmallScreen ? 16 : 26, fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20,),
                      Helper.VideoButton(context, "Register Now", MyHomePage(title: "AdvenTours")),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 200,),

          const Text(
            "We have the best services available for you!",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 5,),

          // Homepage items
          const Padding(
            padding: EdgeInsets.all(20),
            child: HomepageItems(),
          ),

          const SizedBox(height: 30,),

          const Text(
            "Locations",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 5,),

          // Homepage items
          const Padding(
            padding: EdgeInsets.all(20),
            child: HomepageItemsLocations(),
          ),

          const SizedBox(height: 30,),

          const Text(
            "Packages",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 5,),

          // Homepage items
          const Padding(
            padding: EdgeInsets.all(20),
            child: HomepageItemsPackages(),
          ),


          const SizedBox(height: 30,),

          const NewsletterCard(),

        ],
      ),
    );
  }
}
