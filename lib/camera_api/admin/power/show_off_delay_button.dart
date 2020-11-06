import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:theta_req_res/notifiers/response_notifier.dart';
import 'package:theta_req_res/notifiers/request_notifier.dart';
import 'package:theta_req_res/notifiers/req_res_notifier.dart';
import 'package:theta_req_res/utils/format_json.dart';
import 'dart:convert';
import 'package:theta_req_res/camera_api/helpers/return_sleep_delay.dart';

class ShowOffDelayButton extends StatelessWidget {
  const ShowOffDelayButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      onPressed: () async {
        var url = 'http://192.168.1.1/osc/commands/execute';
        var body = jsonEncode({
          'name': 'camera.getOptions',
          'parameters': {
            'optionNames': ['offDelay']
          }
        });
        var formattedResponse;
        var formattedReqRes;

        try {
          var fullResponse = await http.post(url,
              headers: {"Content-Type": "application/json; charset=utf-8"},
              body: body);
          var offDelayMessage = '\n65535 will disable power off';
          formattedResponse =
              formatJson('${fullResponse.body}') + offDelayMessage;
          formattedReqRes = 'REQUEST\n' +
              fullResponse.request.toString() +
              '\n\nRESPONSE\n' +
              formattedResponse;
          context.read<ReqResNotifier>().updateReqRes(formattedReqRes);

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
          context
              .read<ReqResNotifier>()
              .updateReqRes('request failed.\n\n Error code:\n $error');
        }
      },
      child: Text('Show Off Delay'),
    );
  }
}
