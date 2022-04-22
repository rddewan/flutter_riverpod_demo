

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberChangeNotifierProvider = ChangeNotifierProvider<NumberChangeNotifier>((ref) {
  return NumberChangeNotifier();
});

// this is a mutable class / state
class NumberChangeNotifier extends ChangeNotifier {
  int _generatedNumber = 0;
  int get generatedNumber => _generatedNumber;


  void increment(){
    _generatedNumber++;
    notifyListeners();
  }

  void decrement(){
    _generatedNumber--;
    notifyListeners();

  }

}