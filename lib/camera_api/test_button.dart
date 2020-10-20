// test a command
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta_req_res/notifiers/response_notifier.dart';
import 'package:theta_req_res/notifiers/request_notifier.dart';
import 'package:theta_req_res/utils/format_json.dart';
import 'package:http/http.dart' as http;
import 'package:theta_req_res/camera_api/helpers/return_sleep_delay.dart';

class TestButton extends StatelessWidget {
  const TestButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        returnSleepDelay(context);
      },
      child: Text('Test Working Command'),
    );
  }
}
