import 'package:explore_era/modal/flight.dart';
import 'package:flutter/cupertino.dart';

class NotificationNotifier extends ChangeNotifier {
  List<Flight> notifications = [];
  void addNotifications(Flight flight) {
    notifications.add(flight);
    notifyListeners();
  }

  void clearNotifications(Flight flight) {
    notifications
        .removeWhere((element) => element.flightPrice == flight.flightPrice);
    notifyListeners();
  }
}
