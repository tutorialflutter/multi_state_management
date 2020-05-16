import 'package:flutter/foundation.dart';

class MyCart with ChangeNotifier {

  int _quantity = 0;

  int get quantity => _quantity;

  set quantity(int value){
    _quantity = value;
    notifyListeners();
  }


}