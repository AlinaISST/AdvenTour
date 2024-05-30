import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketBooking extends StatefulWidget {
  const TicketBooking({super.key});

  @override
  State<TicketBooking> createState() => _TicketBookingState();
}

class _TicketBookingState extends State<TicketBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF29395B),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Ticket Booking',
          style: GoogleFonts.raleway(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
      body: Column(),
    );
  }
}
