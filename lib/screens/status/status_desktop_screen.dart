import 'package:flutter/material.dart';
import 'package:theta_req_res/camera_api/info_button.dart';
import 'package:theta_req_res/camera_api/state_button.dart';
import 'package:theta_req_res/camera_api/take_picture.dart';
import 'package:theta_req_res/windows/request_window.dart';
import 'package:theta_req_res/windows/response_window.dart';
import 'package:theta_req_res/camera_api/helpers/update_last_file_uri.dart';
import 'package:theta_req_res/camera_api/test_button.dart';
import 'package:theta_req_res/windows/thumb_window.dart';

/// Desktop view of screen shown if over 1000px wide
/// shows basic camera status such as info and state
///
class StatusDesktopScreen extends StatelessWidget {
  const StatusDesktopScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 12,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InfoButton(),
            StateButton(),
            TakePictureButton(),
            RaisedButton(
              onPressed: () {
                updateLastFileUri(context);
              },
              child: Text('Update Image'),
            ),
            TestButton(),
          ],
        ),
        SizedBox(height: 18),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RequestWindow(),
            ResponseWindow(),
            ThumbWindow(),
          ],
        ),
      ],
    );
  }
}
