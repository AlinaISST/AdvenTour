import 'package:explore_era/Screens/ticket_scheduling.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:explore_era/widgets/appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class AllPackages extends StatelessWidget {
  const AllPackages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          BaseAppBar(title: const Text("Packages & Fares"), appBar: AppBar()),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 400.0,
                      viewportFraction: 1.0,
                      autoPlay: true,
                    ),
                    items: _carouselImages.map((url) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(url),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                // Column(
                //   children: _flights.map((flight) {
                //     return FlightFareCard(
                //       airline: flight.airline,
                //       flightNumber: flight.flightNumber,
                //       departureTime: flight.departureTime,
                //       arrivalTime: flight.arrivalTime,
                //       departureAirport: flight.departureAirport,
                //       arrivalAirport: flight.arrivalAirport,
                //       price: flight.price,
                //       logoUrl: flight.logoUrl,
                //     );
                //   }).toList(),
                // ),
                Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: <Widget>[
                    buildMaterial(
                      context,
                      "PIA",
                      "Kashmir",
                      "assets/images/kashmir.png",
                    ),
                    buildMaterial(
                      context,
                      "Emirates",
                      "Dubai",
                      "assets/images/dubai.png",
                    ),
                    buildMaterial(
                      context,
                      "Turkish Airlines",
                      "Istanbul",
                      "assets/images/istanbul.png",
                    ),
                    buildMaterial(
                      context,
                      "Air France",
                      "Paris",
                      "assets/images/paris.png",
                    ),
                    buildMaterial(
                      context,
                      "Garuda Indonesia",
                      "Bali",
                      "assets/images/bali.png",
                    ),
                    buildMaterial(
                      context,
                      "Swiss International Airlines",
                      "Geneva",
                      "assets/images/genevaa.png",
                    ),
                    buildMaterial(
                      context,
                      "British Airways",
                      "London",
                      "assets/images/london.png",
                    ),
                    buildMaterial(
                      context,
                      "Alitalia",
                      "Rome",
                      "assets/images/rome.png",
                    ),
                    buildMaterial(
                      context,
                      "Air India",
                      "Mumbai",
                      "assets/images/mumbai.png",
                    ),
                  ],
                ),

                const SizedBox(height: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TicketScheduling(),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(10),
            width: 230,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'See More',
              style: GoogleFonts.raleway(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    ),
  );
}


final List<String> _carouselImages = [
  "https://picsum.photos/id/1018/1000/600/",
  "https://picsum.photos/id/1015/1000/600/",
  "https://picsum.photos/id/1019/1000/600/",
  "https://picsum.photos/id/1022/1000/600/",
  "https://picsum.photos/id/1024/1000/600/",
];


