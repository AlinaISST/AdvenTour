import 'package:explore_era/Model/user.dart';
import 'package:flutter/cupertino.dart';

class UserNotifier extends ChangeNotifier {
  // ? all clauses list
  User user = User();

  void adduser(User user) {
    this.user = user;
    notifyListeners();
  }
}
