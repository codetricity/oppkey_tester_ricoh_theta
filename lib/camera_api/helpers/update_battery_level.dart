import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:theta_req_res/notifiers/camera_notifier.dart';
import 'dart:convert';

Future<dynamic> updateBatteryLevel(context) async {
  var url = 'http://192.168.1.1/osc/state';
  var response = await http
      .post(url, headers: {"Content-Type": "application/json;charset=utf-8"});
  var responseBody = jsonDecode(response.body);
  var batteryLevel = (responseBody['state']['batteryLevel']);
  print(batteryLevel);
  Provider.of<CameraNotifier>(context, listen: false)
      .updateBattery(batteryLevel);
  return batteryLevel;
}
