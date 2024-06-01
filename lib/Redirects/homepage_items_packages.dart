import 'package:explore_era/Screens/flight_fare_list.dart';
import 'package:explore_era/Screens/home_page.dart';
import 'package:flutter/material.dart';

class HomepageItemsPackages extends StatelessWidget {
  const HomepageItemsPackages({super.key});

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
                "Bronze",
                "2-star hotel with 5 nights stay.\nFree photo session.\nFriendly tour guide.\n24/7 customer help center.\n",
                "Rs. 9, 999",
                "assets/images/2-star.jpg",
              ),
              buildMaterial(
                context,
                "Silver",
                "3-star hotel with 7 nights stay.\nFree photo session.\nFriendly tour guide.\n24/7 customer help center.\n",
                "Rs. 19, 999",
                "assets/images/3-star.jpg",
              ),
              buildMaterial(
                context,
                "Gold",
                "4-star hotel with 10 nights stay.\nFree photo session.\nBreakfast and dinner.\nFriendly tour guide.\n24/7 customer help center.",
                "Rs. 29, 999",
                "assets/images/4-star.jpg",
              ),
              buildMaterial(
                context,
                "Platinum",
                "5-star hotel with 14 nights stay.\nFree photo session and Bonfire.\nBreakfast, lunch and dinner.\nFriendly tour guide.\n24/7 customer help center.",
                "Rs. 39, 999",
                "assets/images/5-star.jpg",
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Color activebuttoncolor = const Color(0xFFFFFFFF); //0xFF9bc1c0
  static Color inactivebuttoncolor = const Color(0xFFa4a4a4);

  Widget buildMaterial(BuildContext context, String name, String subtext,
      String price, String image) {
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
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FlightFareList(),
                ),
              );
            },
            child: const Text("See More"),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
