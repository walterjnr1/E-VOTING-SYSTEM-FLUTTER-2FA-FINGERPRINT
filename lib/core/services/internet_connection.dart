import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionProvider with ChangeNotifier {
  bool _hasInternet = true;

  bool get hasInternet => _hasInternet;

  InternetConnectionProvider() {
    InternetConnectionChecker().onStatusChange.listen((status) {
      _hasInternet = status == InternetConnectionStatus.connected;
      notifyListeners();
    });
  }
}