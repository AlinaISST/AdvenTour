import 'package:explore_era/modal/flight.dart';
import 'package:flutter/cupertino.dart';

class FlightNotifier extends ChangeNotifier {
  List<Flight> flightData = [];
  void addFlightData(Flight flight) {
    flightData.add(flight);
    notifyListeners();
  }

  void clearFlightData(Flight flight) {
    flightData
        .removeWhere((element) => element.flightPrice == flight.flightPrice);
    notifyListeners();
  }

  // List<Flight> currentUserFlights = [];
  // void addCurrentUserFlights(Flight flight) {
  //   currentUserFlights.add(flight);
  //   notifyListeners();
  // }

  // void updateCurrentUserFlights(List<Flight> flights) {
  //   currentUserFlights = flights;
  //   notifyListeners();
  // }

  // void clearCurrentUserFlights(Flight flight) {
  //   currentUserFlights
  //       .removeWhere((element) => element.flightPrice == flight.flightPrice);
  //   flightData
  //       .removeWhere((element) => element.flightPrice == flight.flightPrice);
  //   notifyListeners();
  // }

  int flightBooking = 0;
  void updatedflightBooking(int flightBooking) {
    this.flightBooking = flightBooking;
    notifyListeners();
  }

  String flightPassenger = '00';
  void addFlightPassenger(String flightPassenger) {
    this.flightPassenger = flightPassenger;
    notifyListeners();
  }

  String selectedAirLine = 'Emirates';
  void addAirLine(String selectedAirLine) {
    this.selectedAirLine = selectedAirLine;
    notifyListeners();
  }

  String flightClass = 'Business CLass';
  void addFlightClass(String flightClass) {
    this.flightClass = flightClass;
    notifyListeners();
  }

  String flightFrom = 'PK';
  void addFlightFrom(String flightFrom) {
    this.flightFrom = flightFrom;
    notifyListeners();
  }

  String flightTo = 'US';
  void addFlightTo(String flightTo) {
    this.flightTo = flightTo;
    notifyListeners();
  }

  String flightDepartureDate = 'US';
  void addFlightDepartureDate(String flightDepartureDate) {
    this.flightDepartureDate = flightDepartureDate;
    notifyListeners();
  }

  String flightReturnDate = 'US';
  void addFlightReturnDate(String flightReturnDate) {
    this.flightReturnDate = flightReturnDate;
    notifyListeners();
  }
}
