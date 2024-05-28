import 'dart:async';
import 'package:dotted_line/dotted_line.dart';
import 'package:explore_era/Notifier/flight.notifier.dart';
import 'package:explore_era/Notifier/user.notifier.dart';
import 'package:explore_era/Views/ticket_booking.dart';
import 'package:explore_era/Services/email.services.dart';
import 'package:explore_era/Services/stringFormat.service.dart';
import 'package:explore_era/Modal/flight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ViewBooking extends StatefulWidget {
  const ViewBooking({super.key});

  @override
  State<ViewBooking> createState() => _ViewBookingState();
}

class _ViewBookingState extends State<ViewBooking> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  List<Flight> currentUserFlights = [];
  void addCurrentUserFlights(Flight flight) {
    currentUserFlights.add(flight);
  }

  void updateCurrentUserFlights(List<Flight> flights) {
    currentUserFlights = flights;
  }

  void clearCurrentUserFlights(Flight flight) {
    setState(() {
      currentUserFlights
          .removeWhere((element) => element.flightPrice == flight.flightPrice);
    });
  }

  @override
  void initState() {
    super.initState();
    updaateCurrentUserFlights();
  }

  updaateCurrentUserFlights() {
    final FlightNotifier flightNotifier =
        Provider.of<FlightNotifier>(context, listen: false);
    final UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);

    final flights = flightNotifier.flightData
        .where((element) => element.userEmail == userNotifier.user.email)
        .toList();
    updateCurrentUserFlights(flights);
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    final UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    final FlightNotifier flightNotifier =
        Provider.of<FlightNotifier>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF29395B),
        leading: IconButton(
          onPressed: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => MyHome(),
            ),
          ),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xffFFFFFF),
          ),
        ),
        title: Text(
          'View Booking',
          style: GoogleFonts.raleway(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
      body: isSmallScreen
          ? ListView.builder(
              itemCount: currentUserFlights.length,
              itemBuilder: (context, index) {
                final Flight flight = Flight(
                  flightAirline: currentUserFlights[index].flightAirline,
                  flightDepartureDate:
                      currentUserFlights[index].flightDepartureDate,
                  flightFrom: currentUserFlights[index].flightFrom,
                  flightPassenger: currentUserFlights[index].flightPassenger,
                  flightPrice: currentUserFlights[index].flightPrice,
                  flightReturnDate: currentUserFlights[index].flightReturnDate,
                  flightTo: currentUserFlights[index].flightTo,
                  flightclass: currentUserFlights[index].flightclass,
                );
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Color(0xffFFFFFF),
                                child:
                                    currentUserFlights[index].flightAirline ==
                                            'Emirates'
                                        ? Image.asset(
                                            'assets/images/emirates.png',
                                            fit: BoxFit.fitHeight,
                                          )
                                        : Image.asset(
                                            'assets/images/fly_dubai.png',
                                            width: 36,
                                          ),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                currentUserFlights[index].flightAirline!,
                                style: GoogleFonts.raleway(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentUserFlights[index].lowFarePrice != null
                                    ? 'Rs: ${StringService.addComma(currentUserFlights[index].lowFarePrice!)}'
                                    : 'Rs: ${currentUserFlights[index].flightPrice}',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                              Visibility(
                                visible:
                                    currentUserFlights[index].lowFarePrice !=
                                        null,
                                child: Row(
                                  children: [
                                    const SizedBox(height: 5),
                                    Text(
                                      'Rs: ${currentUserFlights[index].flightPrice}',
                                      style: GoogleFonts.poppins(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat.yMMMEd().format(
                                  DateTime.parse(currentUserFlights[index]
                                      .flightDepartureDate!),
                                ),
                                style: GoogleFonts.raleway(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                              Text(
                                currentUserFlights[index].flightFrom!,
                                style: GoogleFonts.raleway(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 45,
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                const DottedLine(
                                  dashColor: Color.fromARGB(173, 179, 179, 179),
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
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.person_outline_rounded,
                                color: Color(0xffFFFFFF),
                                size: 16,
                              ),
                              Text(
                                currentUserFlights[index].flightPassenger!,
                                style: GoogleFonts.raleway(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 45,
                            child: Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                const DottedLine(
                                  dashColor: Color.fromARGB(173, 179, 179, 179),
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
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat.yMMMEd().format(
                                  DateTime.parse(currentUserFlights[index]
                                      .flightReturnDate!),
                                ),
                                style: GoogleFonts.raleway(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                              Text(
                                currentUserFlights[index].flightTo!,
                                style: GoogleFonts.raleway(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 40,
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return isSmallScreen
                                          ? AlertDialog(
                                              backgroundColor:
                                                  Color(0xffFFFFFF),
                                              title: Text(
                                                'Enter Payment Details',
                                                style: GoogleFonts.raleway(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xFF29395B),
                                                ),
                                              ),
                                              content: SizedBox(
                                                width: 600,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Name',
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xFF29395B),
                                                          ),
                                                        ),
                                                        Text(
                                                          userNotifier
                                                              .user.userName!,
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: const Color(
                                                                0xFF29395B),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Email',
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xFF29395B),
                                                          ),
                                                        ),
                                                        Text(
                                                          userNotifier
                                                              .user.email!,
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: const Color(
                                                                0xFF29395B),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Phone Number',
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xFF29395B),
                                                          ),
                                                        ),
                                                        Text(
                                                          userNotifier.user
                                                              .phoneNumber!,
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: const Color(
                                                                0xFF29395B),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 90,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 20),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: TextField(
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                controller:
                                                                    cardNumberController,
                                                                decoration:
                                                                    InputDecoration(
                                                                  suffixIcon:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            10),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          'assets/images/mastercard.png',
                                                                          width:
                                                                              40,
                                                                        ),
                                                                        Text(
                                                                          '/',
                                                                          style:
                                                                              GoogleFonts.raleway(
                                                                            fontSize:
                                                                                22,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            color:
                                                                                const Color(0xFF29395B),
                                                                          ),
                                                                        ),
                                                                        Image
                                                                            .asset(
                                                                          'assets/images/visa.png',
                                                                          width:
                                                                              40,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(3),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color.fromARGB(
                                                                          150,
                                                                          102,
                                                                          102,
                                                                          102),
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(3),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color.fromARGB(
                                                                          150,
                                                                          102,
                                                                          102,
                                                                          102),
                                                                    ),
                                                                  ),
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                    vertical: 0,
                                                                    horizontal:
                                                                        20.0,
                                                                  ),
                                                                  labelText:
                                                                      'Card Number',
                                                                  hintText:
                                                                      'Enter card number',
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        if (cardNumberController
                                                            .text.isEmpty) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            const SnackBar(
                                                              content: Text(
                                                                  'Enter the card details'),
                                                            ),
                                                          );
                                                        } else {
                                                          showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return const AlertDialog(
                                                                content:
                                                                    LinearProgressIndicator(),
                                                              );
                                                            },
                                                          );

                                                          Timer(
                                                            const Duration(
                                                                seconds: 2),
                                                            () {
                                                              Navigator.pop(
                                                                  context);
                                                              Navigator.pop(
                                                                  context);
                                                              EmmailServiecs
                                                                  .sendEmail(
                                                                email:
                                                                    userNotifier
                                                                        .user
                                                                        .email!,
                                                                message:
                                                                    'Your Flight Booking has been confirm and payment has been recieved successfully.\nThe total payment is Rs:${currentUserFlights[index].lowFarePrice != null ? currentUserFlights[index].lowFarePrice : currentUserFlights[index].flightPrice} Thankyou for choosing us!',
                                                                name: userNotifier
                                                                    .user
                                                                    .userName!,
                                                                subject:
                                                                    'Secure Your Seat: Flight Booking Confirmed!',
                                                              );

                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return AlertDialog(
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xffFFFFFF),
                                                                    title: Text(
                                                                      'Payment Success!',
                                                                      style: GoogleFonts
                                                                          .raleway(
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: const Color(
                                                                            0xFF29395B),
                                                                      ),
                                                                    ),
                                                                    content:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .check_circle_outline_outlined,
                                                                          size:
                                                                              100,
                                                                          color: Colors
                                                                              .green
                                                                              .shade300,
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                40),
                                                                        Text(
                                                                          'Your payment has been done',
                                                                          style:
                                                                              GoogleFonts.raleway(
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color:
                                                                                const Color(0xFF29395B),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                40),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            flightNotifier.clearFlightData(flight);
                                                                            clearCurrentUserFlights(flight);
                                                                            flightNotifier.flightBooking =
                                                                                currentUserFlights.length;
                                                                            Navigator.pop(context);
                                                                            Navigator.pushReplacement(
                                                                              context,
                                                                              CupertinoPageRoute(
                                                                                builder: (context) => const MyHome(),
                                                                              ),
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            height:
                                                                                50,
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
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
                                                                            child:
                                                                                Text(
                                                                              'Done',
                                                                              style: GoogleFonts.raleway(
                                                                                fontSize: 20,
                                                                                fontWeight: FontWeight.bold,
                                                                                color: Color(0xffFFFFFF),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          );
                                                        }
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 60,
                                                        width: double.infinity,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 14,
                                                          vertical: 5,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              const LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                            colors: [
                                                              Color.fromARGB(
                                                                  255,
                                                                  68,
                                                                  97,
                                                                  159),
                                                              Color(0xFF29395B),
                                                            ],
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: Text(
                                                          'Pay Now',
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xffFFFFFF),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          : AlertDialog(
                                              backgroundColor:
                                                  Color(0xffFFFFFF),
                                              title: Text(
                                                'Enter Payment Details',
                                                style: GoogleFonts.raleway(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xFF29395B),
                                                ),
                                              ),
                                              content: SizedBox(
                                                width: 600,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Name',
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xFF29395B),
                                                          ),
                                                        ),
                                                        Text(
                                                          userNotifier
                                                              .user.userName!,
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: const Color(
                                                                0xFF29395B),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 20),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Email',
                                                              style: GoogleFonts
                                                                  .raleway(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: const Color(
                                                                    0xFF29395B),
                                                              ),
                                                            ),
                                                            Text(
                                                              userNotifier
                                                                  .user.email!,
                                                              style: GoogleFonts
                                                                  .raleway(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: const Color(
                                                                    0xFF29395B),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            width: 20),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Phone Number',
                                                              style: GoogleFonts
                                                                  .raleway(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: const Color(
                                                                    0xFF29395B),
                                                              ),
                                                            ),
                                                            Text(
                                                              userNotifier.user
                                                                  .phoneNumber!,
                                                              style: GoogleFonts
                                                                  .raleway(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: const Color(
                                                                    0xFF29395B),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 100,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 30),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: TextField(
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                controller:
                                                                    cardNumberController,
                                                                decoration:
                                                                    InputDecoration(
                                                                  suffixIcon:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            10),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          'assets/images/mastercard.png',
                                                                          width:
                                                                              40,
                                                                        ),
                                                                        Text(
                                                                          '/',
                                                                          style:
                                                                              GoogleFonts.raleway(
                                                                            fontSize:
                                                                                22,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            color:
                                                                                const Color(0xFF29395B),
                                                                          ),
                                                                        ),
                                                                        Image
                                                                            .asset(
                                                                          'assets/images/visa.png',
                                                                          width:
                                                                              40,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(3),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color.fromARGB(
                                                                          150,
                                                                          102,
                                                                          102,
                                                                          102),
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(3),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color.fromARGB(
                                                                          150,
                                                                          102,
                                                                          102,
                                                                          102),
                                                                    ),
                                                                  ),
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                    vertical: 0,
                                                                    horizontal:
                                                                        20.0,
                                                                  ),
                                                                  labelText:
                                                                      'Card Number',
                                                                  hintText:
                                                                      'Enter card number',
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 20),
                                                            Expanded(
                                                              flex: 1,
                                                              child: TextField(
                                                                textCapitalization:
                                                                    TextCapitalization
                                                                        .sentences,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                controller:
                                                                    cvvController,
                                                                decoration:
                                                                    InputDecoration(
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(3),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color.fromARGB(
                                                                          150,
                                                                          102,
                                                                          102,
                                                                          102),
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(3),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color.fromARGB(
                                                                          150,
                                                                          102,
                                                                          102,
                                                                          102),
                                                                    ),
                                                                  ),
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                    vertical: 0,
                                                                    horizontal:
                                                                        20.0,
                                                                  ),
                                                                  labelText:
                                                                      'CVV',
                                                                  hintText:
                                                                      'CVV',
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        if (cardNumberController
                                                                .text.isEmpty &&
                                                            cvvController
                                                                .text.isEmpty) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            const SnackBar(
                                                              content: Text(
                                                                  'Enter the card details'),
                                                            ),
                                                          );
                                                        } else {
                                                          showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return const AlertDialog(
                                                                content:
                                                                    LinearProgressIndicator(),
                                                              );
                                                            },
                                                          );

                                                          Timer(
                                                            const Duration(
                                                                seconds: 2),
                                                            () {
                                                              Navigator.pop(
                                                                  context);
                                                              Navigator.pop(
                                                                  context);
                                                              EmmailServiecs
                                                                  .sendEmail(
                                                                email:
                                                                    userNotifier
                                                                        .user
                                                                        .email!,
                                                                message:
                                                                    'Your Flight Booking has been confirm and payment has been recieved successfully.\nThe total payment is Rs:${currentUserFlights[index].lowFarePrice != null ? currentUserFlights[index].lowFarePrice : currentUserFlights[index].flightPrice} Thankyou for choosing us!',
                                                                name: userNotifier
                                                                    .user
                                                                    .userName!,
                                                                subject:
                                                                    'Secure Your Seat: Flight Booking Confirmed!',
                                                              );

                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return AlertDialog(
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xffFFFFFF),
                                                                    title: Text(
                                                                      'Payment Success!',
                                                                      style: GoogleFonts
                                                                          .raleway(
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: const Color(
                                                                            0xFF29395B),
                                                                      ),
                                                                    ),
                                                                    content:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .check_circle_outline_outlined,
                                                                          size:
                                                                              100,
                                                                          color: Colors
                                                                              .green
                                                                              .shade300,
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                40),
                                                                        Text(
                                                                          'Your payment has been done',
                                                                          style:
                                                                              GoogleFonts.raleway(
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color:
                                                                                const Color(0xFF29395B),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                40),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            flightNotifier.clearFlightData(flight);
                                                                            clearCurrentUserFlights(flight);
                                                                            flightNotifier.flightBooking =
                                                                                currentUserFlights.length;
                                                                            Navigator.pop(context);
                                                                            Navigator.pushReplacement(
                                                                              context,
                                                                              CupertinoPageRoute(
                                                                                builder: (context) => const MyHome(),
                                                                              ),
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            height:
                                                                                50,
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
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
                                                                            child:
                                                                                Text(
                                                                              'Done',
                                                                              style: GoogleFonts.raleway(
                                                                                fontSize: 20,
                                                                                fontWeight: FontWeight.bold,
                                                                                color: Color(0xffFFFFFF),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          );
                                                        }
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 60,
                                                        width: double.infinity,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 14,
                                                          vertical: 5,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              const LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                            colors: [
                                                              Color.fromARGB(
                                                                  255,
                                                                  68,
                                                                  97,
                                                                  159),
                                                              Color(0xFF29395B),
                                                            ],
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: Text(
                                                          'Pay Now',
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xffFFFFFF),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/gpay.png',
                                        height: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        'Pay Now',
                                        style: GoogleFonts.raleway(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xFF29395B),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  if (currentUserFlights.length == 1) {
                                    clearCurrentUserFlights(flight);
                                    flightNotifier.flightData.removeWhere(
                                        (element) =>
                                            element.flightPrice ==
                                            flight.flightPrice);
                                    flightNotifier.flightBooking = 0;
                                  } else {
                                    clearCurrentUserFlights(flight);
                                    flightNotifier.flightData.removeWhere(
                                        (element) =>
                                            element.flightPrice ==
                                            flight.flightPrice);
                                    flightNotifier.flightBooking =
                                        currentUserFlights.length;
                                  }
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
                                        Colors.red.shade200,
                                        Colors.red.shade500,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.delete_rounded,
                                        color: Color(0xffFFFFFF),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        'Cancel Booking',
                                        style: GoogleFonts.raleway(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffFFFFFF),
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
                );
              },
            )
          : ListView.builder(
              itemCount: currentUserFlights.length,
              itemBuilder: (context, index) {
                final Flight flight = Flight(
                  flightAirline: currentUserFlights[index].flightAirline,
                  flightDepartureDate:
                      currentUserFlights[index].flightDepartureDate,
                  flightFrom: currentUserFlights[index].flightFrom,
                  flightPassenger: currentUserFlights[index].flightPassenger,
                  flightPrice: currentUserFlights[index].flightPrice,
                  flightReturnDate: currentUserFlights[index].flightReturnDate,
                  flightTo: currentUserFlights[index].flightTo,
                  flightclass: currentUserFlights[index].flightclass,
                );
                return Container(
                  height: 80,
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                              backgroundColor: Color(0xffFFFFFF),
                              child: currentUserFlights[index].flightAirline ==
                                      'Emirates'
                                  ? Image.asset(
                                      'assets/images/emirates.png',
                                      fit: BoxFit.fitHeight,
                                    )
                                  : Image.asset(
                                      'assets/images/fly_dubai.png',
                                      width: 42,
                                    ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            currentUserFlights[index].flightAirline!,
                            style: GoogleFonts.raleway(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateFormat.yMMMEd().format(
                                    DateTime.parse(currentUserFlights[index]
                                        .flightDepartureDate!),
                                  ),
                                  style: GoogleFonts.raleway(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                                Text(
                                  currentUserFlights[index].flightFrom!,
                                  style: GoogleFonts.raleway(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                            SizedBox(
                              width: 70,
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
                            const SizedBox(width: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.person_outline_rounded,
                                  color: Color(0xffFFFFFF),
                                  size: 18,
                                ),
                                Text(
                                  currentUserFlights[index].flightPassenger!,
                                  style: GoogleFonts.raleway(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 70,
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
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateFormat.yMMMEd().format(
                                    DateTime.parse(currentUserFlights[index]
                                        .flightReturnDate!),
                                  ),
                                  style: GoogleFonts.raleway(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                                Text(
                                  currentUserFlights[index].flightTo!,
                                  style: GoogleFonts.raleway(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 30),
                            Row(
                              children: [
                                Text(
                                  currentUserFlights[index].lowFarePrice != null
                                      ? 'Rs: ${StringService.addComma(currentUserFlights[index].lowFarePrice!)}'
                                      : 'Rs: ${currentUserFlights[index].flightPrice}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                                Visibility(
                                  visible:
                                      currentUserFlights[index].lowFarePrice !=
                                          null,
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      Text(
                                        'Rs: ${currentUserFlights[index].flightPrice}',
                                        style: GoogleFonts.poppins(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Color(0xffFFFFFF),
                                    title: Text(
                                      'Enter Payment Details',
                                      style: GoogleFonts.raleway(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF29395B),
                                      ),
                                    ),
                                    content: SizedBox(
                                      width: 600,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Name',
                                                style: GoogleFonts.raleway(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xFF29395B),
                                                ),
                                              ),
                                              Text(
                                                userNotifier.user.userName!,
                                                style: GoogleFonts.raleway(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xFF29395B),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Email',
                                                    style: GoogleFonts.raleway(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xFF29395B),
                                                    ),
                                                  ),
                                                  Text(
                                                    userNotifier.user.email!,
                                                    style: GoogleFonts.raleway(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: const Color(
                                                          0xFF29395B),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(width: 20),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Phone Number',
                                                    style: GoogleFonts.raleway(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xFF29395B),
                                                    ),
                                                  ),
                                                  Text(
                                                    userNotifier
                                                        .user.phoneNumber!,
                                                    style: GoogleFonts.raleway(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: const Color(
                                                          0xFF29395B),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 100,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 30),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: TextField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      controller:
                                                          cardNumberController,
                                                      decoration:
                                                          InputDecoration(
                                                        suffixIcon: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 10),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Image.asset(
                                                                'assets/images/mastercard.png',
                                                                width: 40,
                                                              ),
                                                              Text(
                                                                '/',
                                                                style:
                                                                    GoogleFonts
                                                                        .raleway(
                                                                  fontSize: 22,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: const Color(
                                                                      0xFF29395B),
                                                                ),
                                                              ),
                                                              Image.asset(
                                                                'assets/images/visa.png',
                                                                width: 40,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(3),
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    150,
                                                                    102,
                                                                    102,
                                                                    102),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(3),
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    150,
                                                                    102,
                                                                    102,
                                                                    102),
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 0,
                                                          horizontal: 20.0,
                                                        ),
                                                        labelText:
                                                            'Card Number',
                                                        hintText:
                                                            'Enter card number',
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 20),
                                                  Expanded(
                                                    flex: 1,
                                                    child: TextField(
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .sentences,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      controller: cvvController,
                                                      decoration:
                                                          InputDecoration(
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(3),
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    150,
                                                                    102,
                                                                    102,
                                                                    102),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(3),
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    150,
                                                                    102,
                                                                    102,
                                                                    102),
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 0,
                                                          horizontal: 20.0,
                                                        ),
                                                        labelText: 'CVV',
                                                        hintText: 'CVV',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (cardNumberController
                                                      .text.isEmpty &&
                                                  cvvController.text.isEmpty) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Enter the card details'),
                                                  ),
                                                );
                                              } else {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return const AlertDialog(
                                                      content:
                                                          LinearProgressIndicator(),
                                                    );
                                                  },
                                                );

                                                Timer(
                                                  const Duration(seconds: 2),
                                                  () {
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                    EmmailServiecs.sendEmail(
                                                      email: userNotifier
                                                          .user.email!,
                                                      message:
                                                          'Your Flight Booking has been confirm and payment has been recieved successfully.\nThe total payment is Rs:${currentUserFlights[index].lowFarePrice != null ? currentUserFlights[index].lowFarePrice : currentUserFlights[index].flightPrice} Thankyou for choosing us!',
                                                      name: userNotifier
                                                          .user.userName!,
                                                      subject:
                                                          'Secure Your Seat: Flight Booking Confirmed!',
                                                    );

                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          backgroundColor:
                                                              Color(0xffFFFFFF),
                                                          title: Text(
                                                            'Payment Success!',
                                                            style: GoogleFonts
                                                                .raleway(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: const Color(
                                                                  0xFF29395B),
                                                            ),
                                                          ),
                                                          content: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .check_circle_outline_outlined,
                                                                size: 100,
                                                                color: Colors
                                                                    .green
                                                                    .shade300,
                                                              ),
                                                              const SizedBox(
                                                                  height: 40),
                                                              Text(
                                                                'Your payment has been done',
                                                                style:
                                                                    GoogleFonts
                                                                        .raleway(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: const Color(
                                                                      0xFF29395B),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  height: 40),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  flightNotifier
                                                                      .clearFlightData(
                                                                          flight);
                                                                  Navigator.pop(
                                                                      context);
                                                                  Navigator
                                                                      .pushReplacement(
                                                                    context,
                                                                    CupertinoPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              const MyHome(),
                                                                    ),
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 50,
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    gradient:
                                                                        const LinearGradient(
                                                                      begin: Alignment
                                                                          .topCenter,
                                                                      end: Alignment
                                                                          .bottomCenter,
                                                                      colors: [
                                                                        Color.fromARGB(
                                                                            255,
                                                                            68,
                                                                            97,
                                                                            159),
                                                                        Color(
                                                                            0xFF29395B),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  child: Text(
                                                                    'Done',
                                                                    style: GoogleFonts
                                                                        .raleway(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Color(
                                                                          0xffFFFFFF),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 60,
                                              width: double.infinity,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 14,
                                                vertical: 5,
                                              ),
                                              decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color.fromARGB(
                                                        255, 68, 97, 159),
                                                    Color(0xFF29395B),
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Text(
                                                'Pay Now',
                                                style: GoogleFonts.raleway(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xffFFFFFF),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
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
                                  Image.asset(
                                    'assets/images/gpay.png',
                                    height: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Pay Now',
                                    style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF29395B),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              if (currentUserFlights.length == 1) {
                                clearCurrentUserFlights(flight);
                                flightNotifier.flightData.removeWhere(
                                    (element) =>
                                        element.flightPrice ==
                                        flight.flightPrice);
                                flightNotifier.flightBooking = 0;
                              } else {
                                clearCurrentUserFlights(flight);
                                flightNotifier.flightData.removeWhere(
                                    (element) =>
                                        element.flightPrice ==
                                        flight.flightPrice);
                                flightNotifier.flightBooking =
                                    currentUserFlights.length;
                              }
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
                                    Colors.red.shade200,
                                    Colors.red.shade500,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.delete_rounded,
                                    color: Color(0xffFFFFFF),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Cancel Booking',
                                    style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
