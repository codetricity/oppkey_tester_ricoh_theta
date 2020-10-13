import 'package:flutter/material.dart';

class RequestNotifier with ChangeNotifier {
  String _requestText = "";
  String get requestText => _requestText;

  void updateRequest(request) {
    _requestText = request;
    notifyListeners();
  }
}
