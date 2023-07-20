import 'package:flutter/material.dart';

class CountStar extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}
