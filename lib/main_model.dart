import 'package:flutter/cupertino.dart';

class MainModel extends ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  int currentIndex = 0;

  void selectedIndex(index) {
    currentIndex = index;
    notifyListeners();
  }
}
