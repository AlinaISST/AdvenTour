import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  List<Map> cartItem = [];

  void addItem (Map item){
    cartItem.add(item);
    notifyListeners();
  }

  void removeItem(Map item){
    cartItem.remove(item);
    notifyListeners();
  } 
}