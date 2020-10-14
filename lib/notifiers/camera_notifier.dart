// hold information about the camera such as
// the camera model

import 'package:flutter/material.dart';

class CameraNotifier with ChangeNotifier {
  bool _appInitialized = false;

  String _model = "";
  var _fileUri = "";
  String get model => _model;
  bool get appInitialized => _appInitialized;

  dynamic get fileUri => _fileUri;

  void updateModel(model) {
    _model = model;
    notifyListeners();
  }

  void setAppIntialized() {
    _appInitialized = true;
  }

  void updateFileUri(fileUri) {
    _fileUri = fileUri;
  }
}
