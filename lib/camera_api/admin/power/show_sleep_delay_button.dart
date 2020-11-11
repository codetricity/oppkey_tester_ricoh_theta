import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:theta_req_res/notifiers/response_notifier.dart';
import 'package:theta_req_res/notifiers/request_notifier.dart';
import 'package:theta_req_res/notifiers/req_res_notifier.dart';
import 'package:theta_req_res/utils/format_json.dart';
import 'dart:convert';
import 'package:theta_req_res/camera_api/helpers/return_sleep_delay.dart';

/// Displays information on sleep status of the camera
/// * Default is 300 seconds
/// * Disable is 65535
/// * Make sure you also disable power off
/// * We're still looking into differences between THETA SC2 sleep and power off
/// https://api.ricoh/docs/theta-web-api-v2.1/options/sleep_delay/
/// ![](https://community.theta360.guide/uploads/default/original/2X/5/5898a475daaa05b3a8e99999971c4c9065aede6f.png)
class ShowSleepDelayButton extends StatelessWidget {
  const ShowSleepDelayButton({
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
            'optionNames': ['sleepDelay']
          }
        });
        var formattedResponse;
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
      child: Text('Show Sleep Delay'),
    );
  }
}
