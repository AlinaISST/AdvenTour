
import 'package:explore_era/Screens/ticket_scheduling.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:explore_era/widgets/appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class FlightFareList extends StatelessWidget {
  const FlightFareList({super.key});

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
                      "assets/images/bali.png",
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
              'Book Now!',
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

class FlightFareCard extends StatelessWidget {
  final String airline;
  final String flightNumber;
  final String departureTime;
  final String arrivalTime;
  final String departureAirport;
  final String arrivalAirport;
  final double price;
  final String logoUrl;

  const FlightFareCard({
    super.key,
    required this.airline,
    required this.flightNumber,
    required this.departureTime,
    required this.arrivalTime,
    required this.departureAirport,
    required this.arrivalAirport,
    required this.price,
    required this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;
        return Card(
          margin: const EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5.0,
          color: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.network(
                      logoUrl,
                      width: isMobile ? 40.0 : 60.0,
                      height: isMobile ? 40.0 : 60.0,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      airline,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildFlightInfo(isMobile, "Flight Number", flightNumber),
                    _buildFlightInfo(
                        isMobile, "Price", "PKR ${price.toStringAsFixed(2)}"),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildFlightInfo(isMobile, "Departure",
                        "$departureTime ($departureAirport)"),
                    Icon(Icons.flight_takeoff, size: isMobile ? 24.0 : 32.0),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildFlightInfo(
                        isMobile, "Arrival", "$arrivalTime ($arrivalAirport)"),
                    Icon(Icons.flight_land, size: isMobile ? 24.0 : 32.0),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFlightInfo(bool isMobile, String label, String info) {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 4.0),
          Text(
            info,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      );
    });
  }
}

class Flight {
  final String airline;
  final String flightNumber;
  final String departureTime;
  final String arrivalTime;
  final String departureAirport;
  final String arrivalAirport;
  final double price;
  final String logoUrl;

  Flight({
    required this.airline,
    required this.flightNumber,
    required this.departureTime,
    required this.arrivalTime,
    required this.departureAirport,
    required this.arrivalAirport,
    required this.price,
    required this.logoUrl,
  });
}

final List<String> _carouselImages = [
  "https://picsum.photos/id/1018/1000/600/",
  "https://picsum.photos/id/1015/1000/600/",
  "https://picsum.photos/id/1019/1000/600/",
  "https://picsum.photos/id/1022/1000/600/",
  "https://picsum.photos/id/1024/1000/600/",
];

final List<Flight> _flights = [
  Flight(
    airline: "Delta Airlines",
    flightNumber: "DL 1234",
    departureTime: "08:00 AM",
    arrivalTime: "11:00 AM",
    departureAirport: "JFK",
    arrivalAirport: "LAX",
    price: 12499.99,
    logoUrl:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Delta_logo_2010.svg/1200px-Delta_logo_2010.svg.png",
  ),
  Flight(
    airline: "United Airlines",
    flightNumber: "UA 5678",
    departureTime: "09:00 AM",
    arrivalTime: "12:00 PM",
    departureAirport: "SFO",
    arrivalAirport: "ORD",
    price: 16199.99,
    logoUrl:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/United_Airlines_logo_2010.svg/1200px-United_Airlines_logo_2010.svg.png",
  ),
  Flight(
    airline: "American Airlines",
    flightNumber: "AA 9101",
    departureTime: "07:00 AM",
    arrivalTime: "10:00 AM",
    departureAirport: "LAX",
    arrivalAirport: "JFK",
    price: 8749.99,
    logoUrl:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/American_Airlines_logo_2013.svg/1200px-American_Airlines_logo_2013.svg.png",
  ),
  Flight(
    airline: "Southwest Airlines",
    flightNumber: "SW 2345",
    departureTime: "06:00 AM",
    arrivalTime: "09:00 AM",
    departureAirport: "DAL",
    arrivalAirport: "ATL",
    price: 10599.99,
    logoUrl:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Southwest_Airlines_logo_2014.svg/1200px-Southwest_Airlines_logo_2014.svg.png",
  ),
];
