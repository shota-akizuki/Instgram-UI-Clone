import 'package:flutter/cupertino.dart';
import '../screen/main_page.dart';

class MainModel extends ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  int currentIndex = 0;
  void selectIndex(index) {
    currentIndex = index;
    notifyListeners();
  }
}
