import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta_req_res/notifiers/response_notifier.dart';
import 'package:theta_req_res/notifiers/request_notifier.dart';
import 'package:theta_req_res/notifiers/req_res_notifier.dart';
import 'package:theta_req_res/utils/format_json.dart';
import 'package:http/http.dart' as http;

/// Show camera info such as THETA model and firmware
///
/// HTTP GET to /osc/info
/// https://api.ricoh/docs/theta-web-api-v2.1/protocols/info/
///
/// Used to get the camera model and firmware version.
/// RICOH THETA API changes depending on camera model and firmware
class InfoButton extends StatelessWidget {
  const InfoButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () async {
        var url = 'http://192.168.1.1/osc/info';
        var formattedResponse;
        var formattedReqRes;

        try {
          var fullResponse = await http.get(url);
          // formattedReqRes = '${fullResponse.request} /n ${fullResponse.body}';
          formattedResponse = formatJson('${fullResponse.body}');
          formattedReqRes = 'REQUEST\n' +
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
      child: Text('info'),
    );
  }
}
