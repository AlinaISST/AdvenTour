import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Home.dart';

class HomepageItems extends StatelessWidget {
  const HomepageItems({Key? key}) : super(key: key);

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
                  const Home()),
              buildOutlinedButton(
                context,
                "Food Services",
                "Catering",
                "assets/icons/food.png",
                const Home(),
              ),
              buildOutlinedButton(
                context,
                "Travel Services",
                "Pick-up/drop",
                "assets/icons/bus.png",
                const Home(),
              ),
              buildOutlinedButton(
                context,
                "Hotel Services",
                "Check-in/out",
                "assets/icons/hotel.png",
                const Home(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Color Activebuttoncolor = const Color(0xFFfbe9d3); //0xFF9bc1c0
  static Color Inactivebuttoncolor = const Color(0xFFa4a4a4);

  OutlinedButton buildOutlinedButton(BuildContext context, String name,
      String subtext, String image, Widget page) {
    return OutlinedButton(
      //child: const Text("Data Provider A"),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
        foregroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF000000)),
        overlayColor: MaterialStateProperty.all<Color>(
            const Color(0xFF707070).withOpacity(0.05)),
        elevation: MaterialStateProperty.all(15.0),
        minimumSize: MaterialStateProperty.all<Size>(const Size(300, 300)),
        textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(fontWeight: FontWeight.bold)),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          );
        }),
      ),

      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            width: 100,
            height: 100,
          ),
          SizedBox(height: 20),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF29395B),
              fontFamily: 'Comfortaa',
              fontSize: 24,
            ),
          ),
          SizedBox(height: 10),
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

      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
