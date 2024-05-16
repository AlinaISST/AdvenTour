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

  int notificationCount = 0;
  void updatedflightBooking(int notificationCount) {
    this.notificationCount = notificationCount;
    notifyListeners();
  }

  // List<Flight> currentUserNotification = [];
  // void addCurrentUserNotification(Flight flight) {
  //   currentUserNotification.add(flight);
  //   notifyListeners();
  // }

  // void updateCurrentUserNotification(List<Flight> flights) {
  //   currentUserNotification = flights;
  //   notifyListeners();
  // }

  // void clearCurrentUserNotification(Flight flight) {
  //   currentUserNotification
  //       .removeWhere((element) => element.flightPrice == flight.flightPrice);
  //   notifyListeners();
  // }
}
