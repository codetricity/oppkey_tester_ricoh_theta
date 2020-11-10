import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:theta_req_res/notifiers/response_notifier.dart';
import 'package:theta_req_res/notifiers/request_notifier.dart';
import 'package:theta_req_res/notifiers/req_res_notifier.dart';
import 'package:theta_req_res/utils/format_json.dart';

/// Get state of camera, including last file URI and battery level
///
/// API version and picture status in sequence of captured pictures
/// for brackets
/// https://api.ricoh/docs/theta-web-api-v2.1/protocols/state/
/// returns
/// * _apiVersion
/// * _cameraError

class StateButton extends StatelessWidget {
  const StateButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () async {
        var url = 'http://192.168.1.1/osc/state';

        try {
          var fullResponse = await http.post(url);
          var formattedResponse = formatJson('${fullResponse.body}');
          var formattedReqRes = 'REQUEST\n' +
              fullResponse.request.toString() +
              '\n\nRESPONSE\n' +
              formattedResponse;
          context.read<ResponseNotifier>().updateResponse(formattedResponse);
          context
              .read<RequestNotifier>()
              .updateRequest('${fullResponse.request}');
          context.read<ReqResNotifier>().updateReqRes(formattedReqRes);
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
      child: Text('state'),
    );
  }
}
