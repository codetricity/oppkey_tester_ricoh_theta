import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:theta_req_res/notifiers/camera_notifier.dart';
import 'dart:convert';

Future<void> updateFileList(context) async {
  var url = 'http://192.168.1.1/osc/commands/execute';
  var body = jsonEncode({
    'name': 'camera.listFiles',
    'parameters': {
      'fileType': 'image',
      'entryCount': 10000,
      'maxThumbSize': 0,
    }
  });
  List<String> fileUriList = [];
  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"}, body: body);
  var responseBody = jsonDecode(response.body);
  var allFiles = (responseBody['results']['entries']);
  allFiles.forEach(
    (fileInfo) => {fileUriList.add(fileInfo['fileUrl'])},
  );
  print(fileUriList);
  Provider.of<CameraNotifier>(context, listen: false)
      .updateFileUriList(fileUriList);

  Provider.of<CameraNotifier>(context, listen: false).updateAllFiles(allFiles);
}
