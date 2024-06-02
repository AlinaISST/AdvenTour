import 'package:flutter/material.dart';

class HomepageItems extends StatelessWidget {
  const HomepageItems({super.key});

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
              buildOutlinedButton(
                context,
                "Flight Services",
                "Arrival and Departure",
                "assets/icons/plane.png",
              ),

              // buildOutlinedButton(
              //   context,
              //   "Food Services",
              //   "Catering",
              //   "assets/icons/food.png",
              //   const MyHomePage(),
              // ),
              // buildOutlinedButton(
              //   context,
              //   "Travel Services",
              //   "Pick-up/drop",
              //   "assets/icons/bus.png",
              //   const MyHomePage(),
              // ),
              // buildOutlinedButton(
              //   context,
              //   "Hotel Services",
              //   "Check-in/out",
              //   "assets/icons/hotel.png",
              //   const MyHomePage(),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  static Color activebuttoncolor = const Color(0xFFfbe9d3); //0xFF9bc1c0
  static Color inactivebuttoncolor = const Color(0xFFa4a4a4);

  buildOutlinedButton(
      BuildContext context, String name, String subtext, String image) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black),
      ),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 20),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF29395B),
              fontFamily: 'Comfortaa',
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtext,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFB0B0B0),
              fontFamily: 'Comfortaa',
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
