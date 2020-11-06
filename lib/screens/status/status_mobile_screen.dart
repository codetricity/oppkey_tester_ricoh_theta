import 'package:theta_req_res/windows/req_res_window.dart';
import 'package:flutter/material.dart';
import 'package:theta_req_res/camera_api/info_button.dart';
import 'package:theta_req_res/camera_api/state_button.dart';
import 'package:theta_req_res/camera_api/take_picture.dart';
import 'package:theta_req_res/camera_api/helpers/update_last_file_uri.dart';
import 'package:theta_req_res/windows/thumb_window.dart';

class StatusMobileScreen extends StatelessWidget {
  const StatusMobileScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoButton(),
                StateButton(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TakePictureButton(),
                RaisedButton(
                  onPressed: () {
                    updateLastFileUri(context);
                  },
                  child: Text('Update Image'),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Container(child: ThumbWindow()),
            Container(height: 300.0, child: ReqResWindow())
          ],
        ),
      ),
    );
  }
}
