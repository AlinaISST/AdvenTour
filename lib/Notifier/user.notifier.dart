import 'package:flutter/cupertino.dart';
import 'package:she_masomo/modal/user.dart';

class UserNotifier extends ChangeNotifier {
  // ? all clauses list
  User user = User();

  void adduser(User user) {
    this.user = user;
    notifyListeners();
  }
}
