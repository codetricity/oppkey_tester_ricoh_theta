import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:theta_req_res/notifiers/camera_notifier.dart';
import 'dart:convert';

Future<void> updateLastFileUri(context) async {
  var url2 = 'http://192.168.1.1/osc/commands/execute';
  var body2 = jsonEncode({
    'name': 'camera.listFiles',
    'parameters': {
      'fileType': 'image',
      'entryCount': 1,
      'maxThumbSize': 0,
    }
  });
  var response2 = await http.post(url2,
      headers: {"Content-Type": "application/json;charset=utf-8"}, body: body2);
  var responseBody2 = jsonDecode(response2.body);
  var latestFileUri = (responseBody2['results']['entries'][0]['fileUrl']);
  print(latestFileUri);
  Provider.of<CameraNotifier>(context, listen: false)
      .updateFileUri(latestFileUri);
}
