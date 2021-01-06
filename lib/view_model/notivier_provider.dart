import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:working_test/model/primes_class.dart';

class ChangePrimaryNotivier with ChangeNotifier {
  List<PrimesClass> _primaryList = List();

  List<PrimesClass> get primeList => _primaryList;

  int _firstInt;
  int _lastInt;

  set setInt(int setInt) {
    (_firstInt != null) ? _lastInt = setInt : _firstInt = setInt;
    notifyListeners();
  }

  setIntNull() {
    _lastInt = null;
    _firstInt = null;
    notifyListeners();
  }

  isPrimary(BuildContext context) {
    final checkInt = int.parse(_firstInt.toString() + _lastInt.toString());
    bool prime = true;
    String status = "not primes";
    int i = 2;
    if (checkInt == 1) {
      prime = false;
    } else {
      while (i <= checkInt / 2) {
        if (checkInt % i == 0) {
          prime = false;
          break;
        }
        i++;
      }
    }
    print(prime);
    DateTime currentDateTime = DateTime.now();
    String curentStringTime = DateFormat("HH:mm").format(currentDateTime);
    if (prime) {
      _primaryList.add(PrimesClass(checkInt, curentStringTime));
      status = "primes";
    }

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$checkInt is $status")));
    notifyListeners();
  }

  int get firstInt => _firstInt;
  int get lastInt => _lastInt;

  bool get isFieldFull => (firstInt != null && lastInt != null);
}
