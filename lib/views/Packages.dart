import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:she_masomo/views/Home.dart';

class PackagesPage extends StatefulWidget {
  const PackagesPage({super.key});

  @override
  State<PackagesPage> createState() => _PackagesPageState();
}

class _PackagesPageState extends State<PackagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Packages',
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: <Widget>[
                    buildMaterial(
                      context,
                      "Bronze",
                      "2-star hotel with 5 nights stay.\nFree photo session.\nFriendly tour guide.\n24/7 customer help center.\n",
                      "Rs. 9, 999",
                      "assets/images/2-star.jpg",
                      const Home(),
                    ),
                    buildMaterial(
                      context,
                      "Silver",
                      "3-star hotel with 7 nights stay.\nFree photo session.\nFriendly tour guide.\n24/7 customer help center.\n",
                      "Rs. 19, 999",
                      "assets/images/3-star.jpg",
                      const Home(),
                    ),
                    buildMaterial(
                      context,
                      "Gold",
                      "4-star hotel with 10 nights stay.\nFree photo session.\nBreakfast and dinner.\nFriendly tour guide.\n24/7 customer help center.",
                      "Rs. 29, 999",
                      "assets/images/4-star.jpg",
                      const Home(),
                    ),
                    buildMaterial(
                      context,
                      "Platinum",
                      "5-star hotel with 14 nights stay.\nFree photo session and Bonfire.\nBreakfast, lunch and dinner.\nFriendly tour guide.\n24/7 customer help center.",
                      "Rs. 39, 999",
                      "assets/images/5-star.jpg",
                      const Home(),
                    ),
                    buildMaterial(
                      context,
                      "Bronze",
                      "2-star hotel with 5 nights stay.\nFree photo session.\nFriendly tour guide.\n24/7 customer help center.\n",
                      "Rs. 9, 999",
                      "assets/images/2-star.jpg",
                      const Home(),
                    ),
                    buildMaterial(
                      context,
                      "Silver",
                      "3-star hotel with 7 nights stay.\nFree photo session.\nFriendly tour guide.\n24/7 customer help center.\n",
                      "Rs. 19, 999",
                      "assets/images/3-star.jpg",
                      const Home(),
                    ),
                    buildMaterial(
                      context,
                      "Gold",
                      "4-star hotel with 10 nights stay.\nFree photo session.\nBreakfast and dinner.\nFriendly tour guide.\n24/7 customer help center.",
                      "Rs. 29, 999",
                      "assets/images/4-star.jpg",
                      const Home(),
                    ),
                    buildMaterial(
                      context,
                      "Platinum",
                      "5-star hotel with 14 nights stay.\nFree photo session and Bonfire.\nBreakfast, lunch and dinner.\nFriendly tour guide.\n24/7 customer help center.",
                      "Rs. 39, 999",
                      "assets/images/5-star.jpg",
                      const Home(),
                    ),
                    buildMaterial(
                      context,
                      "Bronze",
                      "2-star hotel with 5 nights stay.\nFree photo session.\nFriendly tour guide.\n24/7 customer help center.\n",
                      "Rs. 9, 999",
                      "assets/images/2-star.jpg",
                      const Home(),
                    ),
                    buildMaterial(
                      context,
                      "Silver",
                      "3-star hotel with 7 nights stay.\nFree photo session.\nFriendly tour guide.\n24/7 customer help center.\n",
                      "Rs. 19, 999",
                      "assets/images/3-star.jpg",
                      const Home(),
                    ),
                    buildMaterial(
                      context,
                      "Gold",
                      "4-star hotel with 10 nights stay.\nFree photo session.\nBreakfast and dinner.\nFriendly tour guide.\n24/7 customer help center.",
                      "Rs. 29, 999",
                      "assets/images/4-star.jpg",
                      const Home(),
                    ),
                    buildMaterial(
                      context,
                      "Platinum",
                      "5-star hotel with 14 nights stay.\nFree photo session and Bonfire.\nBreakfast, lunch and dinner.\nFriendly tour guide.\n24/7 customer help center.",
                      "Rs. 39, 999",
                      "assets/images/5-star.jpg",
                      const Home(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }

  Material buildMaterial(BuildContext context, String name, String subtext,
      String price, String image, Widget page) {
    return Material(
      color: const Color(0xFFFFFFFF),
      elevation: 10,
      borderRadius: BorderRadius.circular(2),
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
              softWrap: true,
              style: const TextStyle(
                color: Color(0xFF565656),
                fontFamily: 'Comfortaa',
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              price,
              style: const TextStyle(
                color: Color(0xFF29395B),
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
}
