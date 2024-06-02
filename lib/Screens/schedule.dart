import 'dart:async';
import 'dart:math';
import 'package:dotted_line/dotted_line.dart';
import 'package:explore_era/Model/flight.dart';
import 'package:explore_era/Notifier/flight.notifier.dart';
import 'package:explore_era/Notifier/user.notifier.dart';
import 'package:explore_era/Services/stringFormat.service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScheduledFlight extends StatefulWidget {
  const ScheduledFlight({super.key});

  @override
  State<ScheduledFlight> createState() => _ScheduledFlightState();
}

class _ScheduledFlightState extends State<ScheduledFlight> {
  DateTime flightDepartureDate = DateTime.now();
  DateTime flightReturnDate = DateTime.now();
  String flightFrom = '';
  String flightTo = '';
  String flightPassenger = '';
  String selectedAirLine = '';
  String flightClass = '';

  final priceList = [
    '30200',
    '32700',
    '27500',
    '45200',
    '28300',
    '36800',
    '77600',
    '89100',
    '55400'
  ];

  @override
  void initState() {
    super.initState();
    final FlightNotifier flightNotifier =
        Provider.of<FlightNotifier>(context, listen: false);
    DateTime formattedDepartureDate =
        DateTime.parse(flightNotifier.flightDepartureDate);
    DateTime formattedReturnDate =
        DateTime.parse(flightNotifier.flightReturnDate);

    flightDepartureDate = formattedDepartureDate;
    flightReturnDate = formattedReturnDate;
    flightFrom = flightNotifier.flightFrom;
    flightTo = flightNotifier.flightTo;
    flightPassenger = flightNotifier.flightPassenger;
    flightClass = flightNotifier.flightClass;
    selectedAirLine = flightNotifier.selectedAirLine;
  }

  final priceIndex = Random().nextInt(8);
  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    String price = priceList[priceIndex];
    int priceInt = int.parse(price);
    int passengerInt = int.parse(flightPassenger);
    int finalPrice = priceInt * passengerInt;
    final String stringFinalPrice = finalPrice.toString();
    String formattedPrice = StringService.addComma(stringFinalPrice);
    final FlightNotifier flightNotifier =
        Provider.of<FlightNotifier>(context, listen: false);
    final UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF29395B),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xffFFFFFF),
          ),
        ),
        title: Text(
          'Schedule',
          style: GoogleFonts.raleway(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xffFFFFFF),
          ),
        ),
      ),
      body: isSmallScreen
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 68, 97, 159),
                          Color(0xFF29395B),
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: CircleAvatar(
                            radius: 26,
                            backgroundColor: const Color(0xffFFFFFF),
                            child: flightNotifier.selectedAirLine == 'PIA'
                                ? Image.asset(
                                    'assets/images/pia.png',
                                    fit: BoxFit.fitHeight,
                                  )
                                : Image.asset(
                                    'assets/images/emirates.png',
                                    width: 38,
                                  ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 10),
                                child: Text(
                                  selectedAirLine,
                                  style: GoogleFonts.raleway(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xffFFFFFF),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    flightNotifier.flightFrom,
                                    style: GoogleFonts.raleway(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                    child: DottedLine(
                                      dashColor:
                                          Color.fromARGB(173, 179, 179, 179),
                                      lineThickness: 2,
                                      dashRadius: 5,
                                      dashGapLength: 4,
                                      dashLength: 4,
                                    ),
                                  ),
                                  Icon(
                                    Icons.timelapse_rounded,
                                    color: const Color(0xffFFFFFF).withOpacity(0.4),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                    child: DottedLine(
                                      dashColor:
                                          Color.fromARGB(173, 179, 179, 179),
                                      lineThickness: 2,
                                      dashRadius: 5,
                                      dashGapLength: 4,
                                      dashLength: 4,
                                    ),
                                  ),
                                  Text(
                                    flightNotifier.flightTo,
                                    style: GoogleFonts.raleway(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xffFFFFFF),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // height: 250,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 68, 97, 159),
                          Color(0xFF29395B),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 70,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: const Color(0xffFFFFFF),
                                      child: flightNotifier.selectedAirLine ==
                                              'PIA'
                                          ? Image.asset(
                                              'assets/images/pia.png',
                                              fit: BoxFit.fitHeight,
                                            )
                                          : Image.asset(
                                              'assets/images/emirates.png',
                                              width: 42,
                                            ),
                                    ),
                                    const SizedBox(width: 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          selectedAirLine,
                                          style: GoogleFonts.raleway(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xffFFFFFF),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              flightNotifier.flightClass,
                                              style: GoogleFonts.raleway(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xffFFFFFF),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.person_outline_rounded,
                                                  color: Color(0xffFFFFFF),
                                                  size: 18,
                                                ),
                                                Text(
                                                  flightNotifier
                                                      .flightPassenger,
                                                  style: GoogleFonts.raleway(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(0xffFFFFFF),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: Image.asset(
                                  'assets/images/qr_code.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat.yMMMd()
                                      .format(flightDepartureDate),
                                  style: GoogleFonts.raleway(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xffFFFFFF),
                                  ),
                                ),
                                const SizedBox(height: 60),
                                Text(
                                  DateFormat.yMMMd().format(flightReturnDate),
                                  style: GoogleFonts.raleway(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xffFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 6,
                                ),
                                SizedBox(
                                  height: 70,
                                  child: DottedLine(
                                    direction: Axis.vertical,
                                    dashColor:
                                        Color.fromARGB(173, 179, 179, 179),
                                    lineThickness: 2,
                                    dashRadius: 5,
                                    dashGapLength: 4,
                                    dashLength: 4,
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 6,
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'From',
                                          style: GoogleFonts.raleway(
                                            fontSize: 12,
                                            color: const Color(0xffFFFFFF),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          flightFrom,
                                          style: GoogleFonts.raleway(
                                            fontSize: 16,
                                            color: const Color(0xffFFFFFF),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 20),
                                    Transform.rotate(
                                      angle: 1.6,
                                      child: const Icon(
                                        Icons.airplanemode_on,
                                        color: Colors.green,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'To',
                                          style: GoogleFonts.raleway(
                                            fontSize: 12,
                                            color: const Color(0xffFFFFFF),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          flightTo,
                                          style: GoogleFonts.raleway(
                                            fontSize: 16,
                                            color: const Color(0xffFFFFFF),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 55),
                                Row(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'To',
                                          style: GoogleFonts.raleway(
                                            fontSize: 12,
                                            color: const Color(0xffFFFFFF),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          flightTo,
                                          style: GoogleFonts.raleway(
                                            fontSize: 16,
                                            color: const Color(0xffFFFFFF),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 20),
                                    Transform.rotate(
                                      angle: -1.6,
                                      child: const Icon(
                                        Icons.airplanemode_on,
                                        color: Colors.red,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'From',
                                          style: GoogleFonts.raleway(
                                            fontSize: 12,
                                            color: const Color(0xffFFFFFF),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          flightFrom,
                                          style: GoogleFonts.raleway(
                                            fontSize: 16,
                                            color: const Color(0xffFFFFFF),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 68, 97, 159),
                          Color(0xFF29395B),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Totol Price:',
                                style: GoogleFonts.raleway(
                                  fontSize: 14,
                                  color: const Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Rs: $formattedPrice',
                                style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: const Color(0xffFFFFFF),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: LinearProgressIndicator(),
                                  );
                                },
                              );

                              final Flight flight = Flight(
                                flightAirline: selectedAirLine,
                                flightDepartureDate:
                                    flightDepartureDate.toIso8601String(),
                                flightFrom: flightFrom,
                                flightPassenger: flightPassenger,
                                flightPrice: formattedPrice,
                                flightReturnDate:
                                    flightReturnDate.toIso8601String(),
                                flightTo: flightTo,
                                flightclass: flightClass,
                                userEmail: userNotifier.user.email,
                              );

                              flightNotifier.addFlightData(flight);
                              flightNotifier.updatedflightBooking(
                                  flightNotifier.flightData.length);

                              Timer(
                                const Duration(seconds: 2),
                                () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.amber.shade200,
                                    Colors.amber.shade500,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.event_available,
                                    color: Color(0xFF29395B),
                                    size: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Confirm Schedule',
                                    style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF29395B),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 68, 97, 159),
                          Color(0xFF29395B),
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: const Color(0xffFFFFFF),
                                child:
                                    flightNotifier.selectedAirLine == 'PIA'
                                        ? Image.asset(
                                            'assets/images/pia.png',
                                            fit: BoxFit.fitHeight,
                                          )
                                        : Image.asset(
                                            'assets/images/emirates.png',
                                            width: 42,
                                          ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Text(
                              selectedAirLine,
                              style: GoogleFonts.raleway(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xffFFFFFF),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 100),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat.yMMMEd()
                                        .format(flightDepartureDate),
                                    style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xffFFFFFF),
                                    ),
                                  ),
                                  Text(
                                    flightNotifier.flightFrom,
                                    style: GoogleFonts.raleway(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xffFFFFFF),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 150,
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    const DottedLine(
                                      dashColor:
                                          Color.fromARGB(173, 179, 179, 179),
                                      lineThickness: 2,
                                      dashRadius: 5,
                                      dashGapLength: 4,
                                      dashLength: 4,
                                    ),
                                    Transform.rotate(
                                      angle: 1.6,
                                      child: const Icon(
                                        Icons.airplanemode_on,
                                        color: Color(0xffFFFFFF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.timelapse_rounded,
                                color: const Color(0xffFFFFFF).withOpacity(0.4),
                              ),
                              SizedBox(
                                width: 150,
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    const DottedLine(
                                      dashColor:
                                          Color.fromARGB(173, 179, 179, 179),
                                      lineThickness: 2,
                                      dashRadius: 5,
                                      dashGapLength: 4,
                                      dashLength: 4,
                                    ),
                                    Transform.rotate(
                                      angle: 1.6,
                                      child: const Icon(
                                        Icons.airplanemode_on,
                                        color: Color(0xffFFFFFF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat.yMMMEd()
                                        .format(flightReturnDate),
                                    style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xffFFFFFF),
                                    ),
                                  ),
                                  Text(
                                    flightNotifier.flightTo,
                                    style: GoogleFonts.raleway(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xffFFFFFF),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 80),
                      ],
                    ),
                  ),
                  Container(
                    height: 250,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 68, 97, 159),
                          Color(0xFF29395B),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 28,
                                        backgroundColor: const Color(0xffFFFFFF),
                                        child: flightNotifier.selectedAirLine ==
                                                'PIA'
                                            ? Image.asset(
                                                'assets/images/pia.png',
                                                fit: BoxFit.fitHeight,
                                              )
                                            : Image.asset(
                                                'assets/images/emirates.png',
                                                width: 42,
                                              ),
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        selectedAirLine,
                                        style: GoogleFonts.raleway(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xffFFFFFF),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          DateFormat.yMMMd()
                                              .format(flightDepartureDate),
                                          style: GoogleFonts.raleway(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xffFFFFFF),
                                          ),
                                        ),
                                        Text(
                                          DateFormat.yMMMd()
                                              .format(flightReturnDate),
                                          style: GoogleFonts.raleway(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xffFFFFFF),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 50),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            flightNotifier.flightClass,
                                            style: GoogleFonts.raleway(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xffFFFFFF),
                                            ),
                                          ),
                                          const SizedBox(width: 80),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.person_outline_rounded,
                                                color: Color(0xffFFFFFF),
                                                size: 18,
                                              ),
                                              Text(
                                                flightNotifier.flightPassenger,
                                                style: GoogleFonts.raleway(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color(0xffFFFFFF),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Colors.green,
                                                radius: 6,
                                              ),
                                              SizedBox(
                                                height: 100,
                                                child: DottedLine(
                                                  direction: Axis.vertical,
                                                  dashColor: Color.fromARGB(
                                                      173, 179, 179, 179),
                                                  lineThickness: 2,
                                                  dashRadius: 5,
                                                  dashGapLength: 4,
                                                  dashLength: 4,
                                                ),
                                              ),
                                              CircleAvatar(
                                                backgroundColor: Colors.green,
                                                radius: 6,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 30),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 40,
                                                            right: 40),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          'From',
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 14,
                                                            color: const Color(
                                                                0xffFFFFFF),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(
                                                          flightFrom,
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 20,
                                                            color: const Color(
                                                                0xffFFFFFF),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 150,
                                                    child: DottedLine(
                                                      dashColor: Color.fromARGB(
                                                          173, 179, 179, 179),
                                                      lineThickness: 3,
                                                      dashRadius: 5,
                                                      dashGapLength: 5,
                                                      dashLength: 7,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 40,
                                                            right: 40),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          'To',
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 14,
                                                            color: const Color(
                                                                0xffFFFFFF),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(
                                                          flightTo,
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 20,
                                                            color: const Color(
                                                                0xffFFFFFF),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 50),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 40,
                                                            right: 40),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          'From',
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 14,
                                                            color: const Color(
                                                                0xffFFFFFF),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(
                                                          flightTo,
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 20,
                                                            color: const Color(
                                                                0xffFFFFFF),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 150,
                                                    child: DottedLine(
                                                      dashColor: Color.fromARGB(
                                                          173, 179, 179, 179),
                                                      lineThickness: 3,
                                                      dashRadius: 5,
                                                      dashGapLength: 5,
                                                      dashLength: 7,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 40,
                                                            right: 40),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          'To',
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 14,
                                                            color: const Color(
                                                                0xffFFFFFF),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(
                                                          flightFrom,
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 20,
                                                            color: const Color(
                                                                0xffFFFFFF),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 80),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Price',
                                        style: GoogleFonts.raleway(
                                          fontSize: 14,
                                          color: const Color(0xffFFFFFF),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Transform.rotate(
                                        angle: 180.65,
                                        child: Text(
                                          'Rs $formattedPrice',
                                          style: GoogleFonts.raleway(
                                            fontSize: 30,
                                            color: const Color(0xffFFFFFF),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              height: double.infinity,
                              child: DottedLine(
                                direction: Axis.vertical,
                                dashColor: Color(0xffFFFFFF),
                                lineThickness: 4,
                                dashRadius: 8,
                                dashGapLength: 6,
                                dashLength: 6,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: Image.asset(
                                  'assets/images/qr_code.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 68, 97, 159),
                          Color(0xFF29395B),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Totol Price:',
                                    style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      color: const Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Rs: $formattedPrice',
                                    style: GoogleFonts.raleway(
                                      fontSize: 20,
                                      color: const Color(0xffFFFFFF),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: LinearProgressIndicator(),
                                  );
                                },
                              );

                              final Flight flight = Flight(
                                flightAirline: selectedAirLine,
                                flightDepartureDate:
                                    flightDepartureDate.toIso8601String(),
                                flightFrom: flightFrom,
                                flightPassenger: flightPassenger,
                                flightPrice: formattedPrice,
                                flightReturnDate:
                                    flightReturnDate.toIso8601String(),
                                flightTo: flightTo,
                                flightclass: flightClass,
                                userEmail: userNotifier.user.email,
                              );

                              flightNotifier.addFlightData(flight);
                              flightNotifier.updatedflightBooking(
                                  flightNotifier.flightData.length);

                              Timer(
                                const Duration(seconds: 2),
                                () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.amber.shade200,
                                    Colors.amber.shade500,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.event_available,
                                    color: Color(0xFF29395B),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Confirm Schedule',
                                    style: GoogleFonts.raleway(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF29395B),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
