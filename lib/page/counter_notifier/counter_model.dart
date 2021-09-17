import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  int counter = 0;
  int counter2 = 0;

  increment() {
    counter++;
    notifyListeners();
  }

  increment2() {
    counter2++;
    notifyListeners();
  }
}
