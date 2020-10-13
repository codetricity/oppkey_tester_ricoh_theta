import 'package:flutter/material.dart';

class ResponseNotifier with ChangeNotifier {
  String _responseText = "";
  String get responseText => _responseText;

  void updateResponse(response) {
    _responseText = response;
    notifyListeners();
  }
}
