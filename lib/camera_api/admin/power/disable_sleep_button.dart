import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:theta_req_res/notifiers/response_notifier.dart';
import 'package:theta_req_res/notifiers/request_notifier.dart';
// Step 1: Import the notifier
import 'package:theta_req_res/notifiers/req_res_notifier.dart';
import 'package:theta_req_res/utils/format_json.dart';
import 'dart:convert';
import 'package:theta_req_res/camera_api/helpers/return_sleep_delay.dart';

class DisableSleepButton extends StatelessWidget {
  const DisableSleepButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.amber,
      onPressed: () async {
        var url = 'http://192.168.1.1/osc/commands/execute';
        var body = jsonEncode({
          'name': 'camera.setOptions',
          'parameters': {
            'options': {'sleepDelay': 65535}
          }
        });
        var formattedResponse;
        // Step 2: Add this variable
        var formattedReqRes;

        try {
          var fullResponse = await http.post(url,
              headers: {"Content-Type": "application/json; charset=utf-8"},
              body: body);
          var sleepDelayData = await returnSleepDelay(context);
          var sleepDelayMessage =
              '\nCamera will sleep after $sleepDelayData seconds.' +
                  '\n 65535 will disable sleep';
          formattedResponse =
              formatJson('${fullResponse.body}') + sleepDelayMessage;
          // Step3: Start add for ReqRes
          formattedReqRes = 'REQUEST\n' +
              fullResponse.request.toString() +
              '\n\nRESPONSE\n' +
              formattedResponse;
          context.read<ReqResNotifier>().updateReqRes(formattedReqRes);
          // End add for ReqRes
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
          // Step 4: Add error
          context
              .read<ReqResNotifier>()
              .updateReqRes('request failed.\n\n Error code:\n $error');
        }
      },
      child: Text('Disable Sleep'),
    );
  }
}
