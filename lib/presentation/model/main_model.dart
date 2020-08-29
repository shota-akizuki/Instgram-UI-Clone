import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  bool favorite = false;
  void changeFavorite() {
    favorite = !favorite;
    notifyListeners();
  }
}
