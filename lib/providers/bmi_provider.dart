import 'package:flutter/material.dart';

class BMIFormProvider with ChangeNotifier {
  int _height = 0;
  double _weight = 0;
  double _result = 0;

  int get height => _height;
  double get weight => _weight;
  double get result => _result;

  void setHeight(int height) {
    _height = height;
    notifyListeners();
  }

  void setWeight(double weight) {
    _weight = weight;
    notifyListeners();
  }

  void setResult(double result) {
    _result = result;
    notifyListeners();
  }
}
