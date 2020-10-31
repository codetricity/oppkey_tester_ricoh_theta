import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:theta_req_res/notifiers/response_notifier.dart';
import 'package:theta_req_res/notifiers/request_notifier.dart';
import 'package:theta_req_res/utils/format_json.dart';
import 'dart:convert';
import 'package:theta_req_res/camera_api/helpers/update_file_list.dart';

class UpdateFileListButton extends StatelessWidget {
  const UpdateFileListButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        updateFileList(context);
      },
      child: Text('update file list'),
    );
  }
}
