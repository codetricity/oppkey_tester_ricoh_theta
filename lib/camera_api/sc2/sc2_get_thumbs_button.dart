import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:theta_req_res/notifiers/camera_notifier.dart';
import 'package:theta_req_res/notifiers/response_notifier.dart';
import 'package:theta_req_res/notifiers/request_notifier.dart';
import 'package:theta_req_res/utils/format_json.dart';

class Sc2GetThumbsButton extends StatelessWidget {
  const Sc2GetThumbsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () async {
        var url = 'http://192.168.1.1/osc/commands/execute';

        Map data = {
          'name': 'camera.listFiles',
          'parameters': {
            'fileType': 'image',
            'entryCount': 5,
            'maxThumbSize': 0,
            '_detail': false,
          }
        };

        var body = jsonEncode(data);
        var urls = [];
        List<dynamic> thumbs = [];
        var client = http.Client();
        Map<String, String> headers = {
          "Content-Type": "application/json;charset=utf-8"
        };

        try {
          var fullResponse = await http.post(url,
              headers: {'Content-Type': 'application/json; charset=utf-8'},
              body: body);
          var entries =
              await jsonDecode(fullResponse.body)['results']['entries'];
          //TODO:fix below.  This isn't working.
          // Multiple rapid calls for the image thumbnails
          // is not working.
          await entries.forEach((element) async {
            urls.add(element['fileUrl']);
            var thumbResponse = await client
                .get(element["fileUrl"] + '?type=thumb', headers: headers);
            thumbs.add(thumbResponse.bodyBytes);
          });
          context.read<CameraNotifier>().updateLastFiveThumbs(thumbs);

          var formattedResponse = formatJson('${fullResponse.body}');
          context.read<ResponseNotifier>().updateResponse(formattedResponse);
          context
              .read<RequestNotifier>()
              .updateRequest('${fullResponse.request}');
        } catch (error) {
          context
              .read<ResponseNotifier>()
              .updateResponse('request failed.\n\n Error code:\n $error');
          context
              .read<RequestNotifier>()
              .updateRequest('Request failed. \n\n Attempted URL:\n $url');
        } finally {
          client.close();
        }
      },
      child: Text('5 Thumbnails'),
    );
  }
}
