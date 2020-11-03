import 'package:flutter/material.dart';

class ReqResNotifier with ChangeNotifier {
  String _reqResText = "";
  String get reqResText => _reqResText;

  void updateReqRes(reqRes) {
    _reqResText = reqRes;
    notifyListeners();
  }
}
