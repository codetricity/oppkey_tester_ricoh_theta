// hold information about the camera such as
// the camera model

import 'package:flutter/material.dart';

class CameraNotifier with ChangeNotifier {
  bool _appInitialized = false;

  String _model = "";
  var _fileUri = "";
  var _allFiles = [];
  List<String> _fileUriList = [];
  double _battery;
  List<dynamic> _lastFiveThumbs = [];

  // getters
  String get model => _model;
  bool get appInitialized => _appInitialized;
  dynamic get fileUri => _fileUri;
  List<String> get fileUriList => _fileUriList;
  double get battery => _battery;
  dynamic get allFiles => _allFiles;
  List<dynamic> get lastFiveThumbs => _lastFiveThumbs;

// update
  void updateModel(model) {
    _model = model;
    notifyListeners();
  }

  void setAppIntialized() {
    _appInitialized = true;
    notifyListeners();
  }

  void updateFileUri(fileUri) {
    _fileUri = fileUri;
    notifyListeners();
  }

  void updateFileUriList(fileUriList) {
    _fileUriList = fileUriList;
    notifyListeners();
  }

  void updateBattery(batteryLevel) {
    _battery = batteryLevel;
    notifyListeners();
  }

  void updateAllFiles(allFiles) {
    _allFiles = allFiles;
    notifyListeners();
  }

  void updateLastFiveThumbs(lastFiveThumbs) {
    _lastFiveThumbs = lastFiveThumbs;
    notifyListeners();
  }
}
