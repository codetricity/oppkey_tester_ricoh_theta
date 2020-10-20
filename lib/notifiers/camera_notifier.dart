// hold information about the camera such as
// the camera model

import 'package:flutter/material.dart';

class CameraNotifier with ChangeNotifier {
  bool _appInitialized = false;

  String _model = "";
  var _fileUri = "";
  var _allFiles = [];
  double _battery;

  // getters
  String get model => _model;
  bool get appInitialized => _appInitialized;
  dynamic get fileUri => _fileUri;
  double get battery => _battery;
  dynamic get allFiles => _allFiles;

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

  void updateBattery(batteryLevel) {
    _battery = batteryLevel;
    notifyListeners();
  }

  void updateAllFiles(allFiles) {
    _allFiles = allFiles;
    notifyListeners();
  }
}
