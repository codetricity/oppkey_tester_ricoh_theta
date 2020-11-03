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
      onPressed: () {
        List<dynamic> allFileUrls =
            Provider.of<CameraNotifier>(context, listen: false).allFiles;
        List<dynamic> thumbs = [];
        if (allFileUrls.length < 5) {
          print(
              'there are less than 5 images. ${allFileUrls.length} are loaded');
        } else {
          thumbs.add(allFileUrls[0] + '?type=thumb');
          thumbs.add(allFileUrls[1] + '?type=thumb');

          Provider.of<CameraNotifier>(context, listen: false)
              .updateLastFiveThumbs(thumbs);
        }
      },
      child: Text('5 Thumbnails'),
    );
  }
}
