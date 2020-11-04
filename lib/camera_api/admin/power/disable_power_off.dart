import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:theta_req_res/notifiers/response_notifier.dart';
import 'package:theta_req_res/notifiers/request_notifier.dart';
import 'package:theta_req_res/utils/format_json.dart';
import 'dart:convert';

class DisablePowerOffButton extends StatelessWidget {
  const DisablePowerOffButton({
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
            'options': {'offDelay': 65535}
          }
        });
        var formattedResponse;
        try {
          var fullResponse = await http.post(url,
              headers: {"Content-Type": "application/json; charset=utf-8"},
              body: body);
          // var offDelayData = await returnSleepDelay(context);
          // var offDelayMessage =
          //     '\nCamera will sleep after $sleepDelayData seconds.' +
          //         '\n 65535 will disable sleep';
          formattedResponse = formatJson('${fullResponse.body}');

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
        }
      },
      child: Text('Disable Power Off'),
    );
  }
}
